% À partir de SimulerRayon.m
% Étape 1.1 : 
        % NOTE IMPORTANTE : ORDRE DES OPÉRATIONS.
        % a. On trouve le range. (Angle max et Angle min) V
        % b. On sélectionne N et M pour polaire et azimutal. N
        % c. b) nous retourne les VARIATION comme valeurs. V
        % d. On boucle tant que i < N et j < M, en boucles imbriquées. N
        % e. On a besoin d'une fonction qui prend les VARIATIONS et i, j
        % elle nous retournera la droite à shooter.
            %droite = DroiteAleatoire(positionPhoton, systeme)
            
            % TO-DO : ENLEVER, SERT A RIEN
function [variationTheta, variationPhi] = VariationAngle(rangeVertical, rangeHorizontal, N, M)
    thetaMin = rangeVertical(1);
    thetaMax = rangeVertical(2);
    phiMin = rangeHorizontal(1);
    phiMax = rangeHorizontal(2);
    
    variationTheta = thetaMin + ( (thetaMax - thetaMin) / (2 * N) );
    variationPhi = phiMin + ( (phiMax - phiMin) / (2 * M) );
end