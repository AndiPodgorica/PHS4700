classdef Constantes
    properties (Constant)
        %Les jambes
        RAYON_JAMBE = 0.06 %m
        LONGUEUR_JAMBE = 0.75 %m
        MASSE_VOL_JAMBE = 1052 %kg/m3
        VOLUME_JAMBE = pi*(0.06)^2*0.75 %m3
        CM_JAMBE_DROITE = [0.1; 0; 0.375] % 0.75/2 = 0.375
        CM_JAMBE_GAUCHE = [-0.1; 0; 0.375]
        
        %le tronc
        RAYON_TRONC = 0.15 %m
        LONGUEUR_TRONC = 0.7 %m
        MASSE_VOL_TRONC = 953 %kg/m3
        VOLUME_TRONC = pi*(0.15)^2*0.7 %m3
        CM_TRONC = [0; 0; 1.1] % 0.75 + (0.70/2) = 1.1 
        
        %le cou
        RAYON_COU = 0.04 %m
        LONGUEUR_COU = 0.1 %m
        MASSE_VOL_COU = 953 %kg/m3
        VOLUME_COU = pi*(0.04)^2*0.1 %m3
        CM_COU = [0; 0; 1.5] % 0.75 + 0.70 +(0.10/2) = 1.5
        
        %la tete
        RAYON_TETE = 0.1 %m
        MASSE_VOL_TETE = 1056 %kg/m3
        VOLUME_TETE = (4/3)*pi*(0.1)^3 %m3
        CM_TETE = [0; 0; 1.65] % 0.75 + 0.70 +0.10 + 0.1 = 1.65
        
        %les bras
        RAYON_BRAS = 0.03 %m
        LONGUEUR_BRAS = 0.75 %m
        MASSE_VOL_BRAS = 1052 %kg/m3
        VOLUME_BRAS = pi*(0.03)^2*0.75 %m3
        
        % Parallele au tronc
        CM_BRAS_PARA_DROIT = [0.18; 0; 1.075] % 0.15 + 0.03 = 0.18  0.75 + 0.7 - 0.75/2 = 1.075
        %CM_BRAS_PARA_GAUCHE = [-0.18; 0; 1.075]
        %Perpendiculaire au tronc
        %CM_BRAS_PERP_DROIT = [0.525, 0, 1.42] % 0.15 + 0.75/2 = 0.18  0.75 + 0.7 - 0.03 = 1.075
        CM_BRAS_PERP_GAUCHE = [-0.525; 0; 1.42]
    end
end
