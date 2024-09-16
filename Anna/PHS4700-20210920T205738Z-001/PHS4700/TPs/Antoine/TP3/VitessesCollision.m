function [vBalle vBoite] = VitessesCollision( balle, boite, pCollision )
    % Coefficient
    e = 0.5;

    vectNormal = pCollision - balle.CentreDeMasse(:,end);
    normale = vectNormal / norm(vectNormal);
    
    rBaP = balle.CentreDeMasse(:,end) - pCollision;
    rBoP = boite.CentreDeMasse(:,end) - pCollision;
    vBaP = balle.V(:,end);
    vBoP = boite.V(:,end);

    IbaOrigine = inertie(balle.Masse, balle.Rayon, 0, true);
    Iba = TranslationI(IbaOrigine, balle.Masse, balle.CentreDeMasse(:,end));
    
    IboOrigine = inertie(boite.Masse, boite.Rayon, boite.Longueur, false);
    Ibo = TranslationI(IboOrigine, boite.Masse, boite.CentreDeMasse(:,end));

    Gba = dot(normale,  Iba \ cross(cross(rBaP, normale), rBaP));
    Gbo = dot(normale,  Ibo \ cross(cross(rBoP, normale), rBoP));
    a = 1 / ((1 / balle.Masse) + (1 / boite.Masse) + Gba + Gbo);
    vRelAvant = dot(normale, (vBoP - vBaP));
    j = -a * (1 + e) * vRelAvant;

    % Vitesse et vitesse angulaire de la balle avant collision
    vBai = vBaP;
    wBai = [0 0 0]';
    % Vitesse et vitesse angulaire de la balle apres collision
    vBaf = vBaP - j * ((normale / balle.Masse) + Iba \ cross((cross(rBaP, normale)), rBaP));
    wBaf = [0 0 0]' - j * (Iba \ cross(rBaP, normale));
    
    vBalle = [vBai wBai vBaf wBaf];
    
    % Vitesse et vitesse angulaire de la boite avant collision
    vBoi = vBoP;
    wBoi = boite.W;
    % Vitesse et vitesse angulaire de la boite apres collision
    vBof = vBoP + j * ((normale / boite.Masse) + Ibo \ cross((cross(rBoP, normale)), rBoP));
    wBof = boite.W + j * (Ibo \ cross(rBoP, normale));
    
    vBoite = [vBoi wBoi vBof wBof];
end

