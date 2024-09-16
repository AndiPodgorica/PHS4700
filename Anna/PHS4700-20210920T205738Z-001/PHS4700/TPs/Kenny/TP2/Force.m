classdef Force
    %Regroupe les forces à prendre en compte
    % Option 1: Force gravitationnel
    % Option 2: Force de frottement visqueux
    % Option 3: Force de Magnus
    
    methods(Static)
        function f = gravitationel(masse)
            %Formule de la force gravitationnel
            f = [0; 0; masse * -9.81];
        end
        
        function f = frottementVisqueux(rayon, vitesse)
            %Formule du frottement visqueux
            cAire = 0.5;
            p = 1.2;
            f = - pi * (2 * rayon) ^ 2 / 8 * p * cAire * norm(vitesse) * vitesse;
        end
        
        function f = magnus(rayon, vitesseAngulaire, vitesse)
            %Formule du frottement visqueux
            coefficientDeMagnus = 0.29;
            p = 1.2;
            f = (4 * pi * ((rayon)^3) * p * coefficientDeMagnus * cross(vitesseAngulaire, vitesse)); 
        end
        
    end
    
end

