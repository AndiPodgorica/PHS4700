classdef MomentInertie
    methods(Static =true)
        function MI = MI(theta, pos, cm_global_patineur)
            
            % Moment d'inertie rotaté + translaté de chaque partie du corps
            Ic_tronc = MomentInertie.IdCylindreVertical(theta, pos, cm_global_patineur, Constantes.MASSE_VOL_TRONC * Constantes.VOLUME_TRONC, Constantes.RAYON_TRONC, Constantes.LONGUEUR_TRONC, Constantes.CM_TRONC);
            Ic_cou = MomentInertie.IdCylindreVertical(theta, pos, cm_global_patineur, Constantes.MASSE_VOL_COU * Constantes.VOLUME_COU, Constantes.RAYON_COU, Constantes.LONGUEUR_COU, Constantes.CM_COU);
            Ic_jambe_droite = MomentInertie.IdCylindreVertical(theta, pos, cm_global_patineur, Constantes.MASSE_VOL_JAMBE * Constantes.VOLUME_JAMBE, Constantes.RAYON_JAMBE, Constantes.LONGUEUR_JAMBE, Constantes.CM_JAMBE_DROITE);
            Ic_jambe_gauche = MomentInertie.IdCylindreVertical(theta, pos, cm_global_patineur, Constantes.MASSE_VOL_JAMBE * Constantes.VOLUME_JAMBE, Constantes.RAYON_JAMBE, Constantes.LONGUEUR_JAMBE, Constantes.CM_JAMBE_GAUCHE);
            Ic_bras_droit = MomentInertie.IdCylindreVertical(theta, pos, cm_global_patineur, Constantes.MASSE_VOL_BRAS * Constantes.VOLUME_BRAS, Constantes.RAYON_BRAS, Constantes.LONGUEUR_BRAS, Constantes.CM_BRAS_PARA_DROIT);
            Ic_bras_gauche = MomentInertie.IdCylindreHorizontal(theta, pos, cm_global_patineur, Constantes.MASSE_VOL_BRAS * Constantes.VOLUME_BRAS, Constantes.RAYON_BRAS, Constantes.LONGUEUR_BRAS, Constantes.CM_BRAS_PERP_GAUCHE);
            Ic_tete = MomentInertie.IdSphere(theta, pos, cm_global_patineur, Constantes.MASSE_VOL_TETE * Constantes.VOLUME_TETE, Constantes.RAYON_TETE, Constantes.CM_TETE); 
            
            % Moment d'inertie dans le référentiel du patineur
            MI = Ic_tronc + Ic_cou + Ic_jambe_droite + Ic_jambe_gauche + Ic_bras_gauche + Ic_bras_droit + Ic_tete;
            
        end
        
        function Id = IdCylindreVertical(theta, pos, cm_global_patineur, m, r, L, cm_local_element)
                
            % Moment inertie (Ic) cylindre vertical
            Ic_xx = m / 4 * r^2 + m / 12 * L^2;
            Ic_yy = Ic_xx;
            Ic_zz = m / 2 * r^2;
            Ic = [Ic_xx 0 0; 
                  0 Ic_yy 0; 
                  0 0 Ic_zz];
              
            % Translation des axes (cm_global_patineur)
            Id = MomentInertie.matriceId(pos, theta, Ic, cm_global_patineur, cm_local_element, m);
        end
        
        function Id = IdCylindreHorizontal(theta, pos, cm_global_patineur, m, r, L, cm_local_element)
                
            % Moment inertie (Ic) cylindre horizontal
            Ic_zz = m / 4 * r^2 + m / 12 * L^2;
            Ic_yy = Ic_zz;
            Ic_xx = m / 2 * r^2;
            Ic = [Ic_xx 0 0; 
                  0 Ic_yy 0; 
                  0 0 Ic_zz];
            
            % Translation des axes (cm_global_patineur)
            Id = MomentInertie.matriceId(pos, theta, Ic, cm_global_patineur, cm_local_element, m);
        end
        
        function Id = IdSphere(theta, pos, cm_patineur, m, r, cm_local_element)
            
            % Moment inertie (Ic) sphere
            Ic_xx = 2 * m / 5 * r^2;
            Ic_yy = Ic_xx;
            Ic_zz = Ic_xx;
            Ic = [Ic_xx 0 0; 0 Ic_yy 0; 0 0 Ic_zz];
            
            % Translation des axes (cm_global_patineur)
            Id = MomentInertie.matriceId(pos, theta, Ic, cm_patineur, cm_local_element, m);   
        end
        
        function Id = matriceId(pos, theta, Ic, cm_global_patineur, cm_local_element, m)
                      
            % Matrice rotation pour trouver les cm des éléments dans le 
            % référentiel global et tourner chaque partie du corps comme il faut
            R_y = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];
            
            % Rotation de la matrice d'inertie d'un élément pour qu'il soit
            % tourné avec le même angle que le patineur (et non droit)
            Ic = R_y * Ic * R_y.';
            
            % Calcul position cm element dans le système du laboratoire
            cm_global_element = pos + R_y * cm_local_element;
            
            % Calcul d_c pour déplacer le moment d'inertie
            d_c = cm_global_patineur - cm_global_element;
            
            % Matrice translation pour déplacer Ic_element
            T = [d_c(2)^2 + d_c(3)^2 -d_c(1) * d_c(2) -d_c(1) * d_c(3); 
                 -d_c(2) * d_c(1) d_c(1)^2 + d_c(3)^2 -d_c(2) * d_c(3); 
                 -d_c(3) * d_c(1) -d_c(3) * d_c(2) d_c(1)^2 + d_c(2)^2];
            
            % Moment inertie translaté
            Id = Ic + m * T;            
        end    
    end
end