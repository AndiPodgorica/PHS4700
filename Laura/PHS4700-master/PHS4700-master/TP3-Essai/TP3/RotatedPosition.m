function [rotatedPos] = RotatedPosition(rf, longueur)
    % Determiner la position des 4 coins de l'auto a ou b selon la position
    % et l'orientation
    posX = rf(1);
    posY = rf(2);
    angle = rf(3);
    longueurX = longueur(1)/2; % longueur auto
    longueurY = longueur(2)/2; % largeur auto
    
    % 4 coins de l'auto 
    % 4 o---------o 3
    %   |         |
    %   |         |
    % 1 o---------o 2
    % matrix = [1,2,3,4] selon le centre de masse au milieu
    matrixPosNotRotated = [-longueurX -longueurY; longueurX -longueurY; longueurX longueurY; -longueurX longueurY];
    
    rotate = Rotate(angle, matrixPosNotRotated);
    
    posVector = [posX posY];
    rotatedPos = [rotate(1, :) + posVector; rotate(2,:) + posVector; rotate(3,:) + posVector; rotate(4,:) + posVector];
end