% À partir de SimulerRayon.m
% Étape 1.1 : 
        % NOTE IMPORTANTE : ORDRE DES OPÉRATIONS.
        % a. On trouve le range. (Angle max et Angle min)
        % b. On sélectionne N et M pour polaire et azimutal. Pas ma partie?
        % c. b) nous retourne les VARIATION comme valeurs.
        % d. On boucle tant que i < N et j < M, en boucles imbriquées.
        % e. On a besoin d'une fonction qui prend les VARIATIONS et i, j
        % elle nous retournera la droite à shooter.
            %droite = DroiteAleatoire(positionPhoton, systeme);
function [droite, omega] = DroiteAleatoire(pointObservateur, systeme, N, M, n, m)

    % On initialise la droite avec le point.
    droite = Droite();
    
    % pointObservateur est deja un vecteur.
    droite.Point = pointObservateur;
    
    % a. On trouve le range. (Angle max et Angle min)
    [rangeVertical, rangeHorizontal] = IntervallesAnglesPossibles(pointObservateur, systeme);
    
    % Hardcode du range pour test
    % rangeVertical = [pi/2 -pi/4];
    % rangeHorizontal = [0 pi/2];
    
    % On calcule l'angle à utiliser
    [thetaN, phiM] = EchantillonAngle(rangeVertical, rangeHorizontal, N, M, n, m);    
    % On calcule la pente et on l'affecte à la droite.
    omega = VecteurDirecteur(droite, thetaN, phiM);
end

