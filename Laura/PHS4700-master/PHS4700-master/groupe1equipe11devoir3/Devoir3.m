function [Coll, tf, raf, vaf, rbf, vbf] = Devoir3(rai, vai, rbi, vbi, tb)

    dt = 0.0001;
    minSpeed = 0.01;
    dimensionsA = [4.78 1.82];
   	dimensionsB = [4.23 1.6];
    omega_0_a =  AngleRotation(vai);
    omega_0_b = AngleRotation(vbi);
    
    w_a_0 = vai(3);
    w_b_0 = 0;% Ne tourne pas au d�part
    
    
    % Conditions actuelles (finales = initiales)
    tf = 0;
    raf = [rai(1) rai(2) omega_0_a];
    vaf = [vai(1) vai(2) w_a_0];
    rbf = [rbi(1) rbi(2) omega_0_b];
    vbf = [vbi(1) vbi(2) w_b_0]; 
    
    % Initialisation des q (avec les valeurs actuelles)
    % q = [v_x, v_y, r_x, r_y]
    q_a = [vaf(1) vaf(2) raf(1) raf(2)];
    q_b = [vbf(1) vbf(2) rbf(1) rbf(2)];
    
    Coll = 1; % Pour entrer dans le while --> 1 veut dire pas de collision
    while((norm([vaf(1) vaf(2)]) >= minSpeed || norm([vbf(1) vbf(2)]) >= minSpeed) && Coll == 1)
        
        % D�tection des collisions
        rotated_positionA = RotatedPosition(raf, dimensionsA);
		rotated_positionB = RotatedPosition(rbf, dimensionsB);
        [isCollision, collisionVector] = Collision(raf(3), rbf(3), rotated_positionA, rotated_positionB, [raf(1) raf(2)], [rbf(1) rbf(2)]);
        
        if(isCollision > 0) % Si collision
            % M�thode des conditions initiales
		    [vaf, vbf] = PostCollision(raf, vaf, rbf, vbf, collisionVector, isCollision);
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
                g = 'CarRun';                
            else
                g = 'CarBreak';
                w_b_0 = vbi(3); % Commence � tourner, on pose w_z
            end
            
            % Prochaines conditions pour B, si toujours en mouvement
            if norm([vbf(1) vbf(2)]) >= minSpeed
                q_b = RungeKutta(q_b, 2, dt, g);
            end
            
            % Entr�e des vitesses actuelles
            vaf = [q_a(1) q_a(2) w_a_0 ];
            vbf = [q_b(1) q_b(2) w_b_0];
        end
        deltaTb = tf;
        % Entr�e des positions actuelles dans les variables de sortie
        if(tf == tb)
            omega_0_b = rbf(3); 
        end
        if(tf>=tb)
            deltaTb =tf-tb;
        end
        raf = [q_a(3) q_a(4) omega_0_a + w_a_0*tf];
        rbf = [q_b(3) q_b(4) omega_0_b + w_b_0*deltaTb];

    end
    
                     
end