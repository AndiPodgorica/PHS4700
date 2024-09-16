classdef CentreMasse
    methods(Static =true)
        function poscm = CM(pos, theta)
            % Calcul de la masse totale
            masseTotale = (Constantes.MASSE_VOL_JAMBE * Constantes.VOLUME_JAMBE * 2 + Constantes.MASSE_VOL_TRONC * Constantes.VOLUME_TRONC + ... 
                Constantes.MASSE_VOL_COU * Constantes.VOLUME_COU + Constantes.MASSE_VOL_TETE * Constantes.VOLUME_TETE ...
                + Constantes.MASSE_VOL_BRAS * Constantes.VOLUME_BRAS * 2);
            
            % Calcul des centre de masse pour chaque partie du corps
            cmTronc = Constantes.CM_TRONC * Constantes.MASSE_VOL_TRONC * Constantes.VOLUME_TRONC;
            
            cmCou = Constantes.CM_COU * Constantes.MASSE_VOL_COU * Constantes.VOLUME_COU;
            
            cmTete = Constantes.CM_TETE * Constantes.MASSE_VOL_TETE * Constantes.VOLUME_TETE;
                        
            cmJambeDroite = Constantes.CM_JAMBE_DROITE * Constantes.MASSE_VOL_JAMBE * Constantes.VOLUME_JAMBE;
            cmJambeGauche = Constantes.CM_JAMBE_GAUCHE * Constantes.MASSE_VOL_JAMBE * Constantes.VOLUME_JAMBE;
            
            % Le patineur a le bras droit parallele et gauche
            % perpendiculaire
            cmBrasParaDroit = Constantes.CM_BRAS_PARA_DROIT * Constantes.MASSE_VOL_BRAS * Constantes.VOLUME_BRAS;
            cmBrasPerpGauche = Constantes.CM_BRAS_PERP_GAUCHE * Constantes.MASSE_VOL_BRAS * Constantes.VOLUME_BRAS;
            
            % Somme des centres de masse
            sommeCm = cmTronc + cmCou + cmTete + cmJambeDroite + cmJambeGauche + cmBrasParaDroit + cmBrasPerpGauche;
            
            % Matrice de rotation selon l'axe Y
            rotationAxeY = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];
            
            % Position du centre de masse (référentiel du laboratoire)
            poscm = pos + rotationAxeY *(sommeCm/masseTotale); 
        end
    end
end