classdef AccelerationAngulaire
    methods(Static =true)
        function aa = Acceleration(pos, theta, mi, wz, F_local, pcm)
            
            % Matrice de rotation selon l'axe Y
            R_y = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];
            
            % Vitesse angulaire patineur
            w_local = [0; 0; wz];
            w_global = R_y * w_local;
            
            % MOMENT DE FORCE
            
            % Force dans le référentiel du système
            F_global = R_y * F_local;
            
            % Point de force dans le référentiel du système
            zf = Constantes.LONGUEUR_JAMBE + Constantes.LONGUEUR_TRONC + Constantes.LONGUEUR_COU + Constantes.RAYON_TETE;
            ptForce_local = [0; Constantes.RAYON_TETE; zf];
            ptForce_global = pos + R_y * ptForce_local;
            
            % Moment de force
            momentForce = cross(ptForce_global - pcm, F_global); 
            
            % MOMENT CINÉTIQUE
            momentCinetique = mi * w_global;
            
            % ACCÉLÉRATION ANGULAIRE
            aa = mi\(momentForce + cross(momentCinetique, w_global));
        end
        
    end
end