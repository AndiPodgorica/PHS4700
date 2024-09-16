function [Coll, tf, raf, vaf, rbf, vbf] = Devoir3(rai, vai, rbi, vbi, tb)

    dt = 0.0001;
    minSpeed = 0.01;
    
    omega_a_0 = AngleRotation([vai(1) vai(2)]);
    omega_b_0 = AngleRotation([vbi(1) vbi(2)]);
    w_a_0 = vai(3) ;
    w_b_0 = 0;% Ne tourne pas au d�part
    
    % Conditions actuelles (finales = initiales)
    tf = 0;
    raf = [rai(1) rai(2) omega_a_0];
    vaf = [vai(1) vai(2) w_a_0];
    
    rbf = [rbi(1) rbi(2) omega_b_0];
    vbf = [vbi(1) vbi(2) w_b_0]; 
    
    % Initialisation des q (avec les valeurs actuelles)
    % q = [v_x, v_y, r_x, r_y]
    q_a = [vaf(1) vaf(2) raf(1) raf(2)];
    q_b = [vbf(1) vbf(2) rbf(1) rbf(2)];
    
    Coll = 1; % Pour entrer dans le while --> 1 veut dire pas de collision
    while((norm([vaf(1) vaf(2)]) >= minSpeed || norm([vbf(1) vbf(2)]) >= minSpeed) && Coll == 1)
        
        % D�tection des collisions
    
        [isCollision, collisionNormal, coin] = CheckCol(raf, rbf);
        
        if(isCollision(1, 1) > 0) % Si collision
            % M�thode des conditions initiales
		    [vaf, vbf] = AfterCollision(collisionNormal, coin, vaf, vbf, raf, rbf);
		    Coll = 0;
        else % Si pas encore de collision
            % Runge-Kutta pour obtenir les prochaines conditions des voitures
            tf = tf + dt; % Passer au prochain moment
            
            % Prochaines conditions pour A, si toujours en mouvement
            if norm([vaf(1) vaf(2)]) >= minSpeed
                q_a = RungeKutta(q_a, 1, dt, @CarBreak);
            end
            
            % Fonction � utiliser pour le d�placement de B
            if tf < tb
                g = @CarRun;                
            else
                g = @CarBreak;
                vbf(3) = vbi(3);
            end
            
            % Prochaines conditions pour B, si toujours en mouvement
            if norm([vbf(1) vbf(2)]) >= minSpeed
                q_b = RungeKutta(q_b, 2, dt, g);
            end
            
            vaf(1) = q_a(1);
            vaf(2) = q_a(2);
            
            vbf(1) = q_b(1);
            vbf(2) = q_b(2);

        end
        
        % Entr�e des positions actuelles dans les variables de sortie
        raf(1) = q_a(3);
        raf(2) = q_a(4);
        raf(3) = omega_a_0 + w_a_0*tf;

        rbf(1) = q_b(3);
        rbf(2) = q_b(4);

        deltaTb = tf;
        if(tf >= tb)
            w_b_0 = vbi(3);
            deltaTb = tf-tb;
        end
        rbf(3) = omega_b_0 + w_b_0*deltaTb;

    end
                     
end
