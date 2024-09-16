function [vaf, vbf] = VitessesApresCollision(systeme, cmA, cmB, vitesseA, vitesseB, pointDeCollision, normale)
    %normale
    normale(3) = 0;
    normale = -normale / norm(normale);
    
    %position et vitesse du point ou la force est appliqué
    rAp = cmA - pointDeCollision;
    rAp(3) = 0;
    rBp = cmB - pointDeCollision;
    rBp(3) = 0;
    vAp = vitesseA;
    vAp(3) = 0;
    vBp = vitesseB;
    vBp(3) = 0;
    
    %Inertie
    InertieA = [1 0 0 ; 0 1 0; 0 0 1];
    InertieA(1,1) = systeme.AutoA.Masse * (systeme.AutoA.Hauteur^2 + systeme.AutoA.Largeur^2) / 12;
    InertieA(2,2) = systeme.AutoA.Masse * (systeme.AutoA.Hauteur^2 + systeme.AutoA.Longueur^2) / 12;
    InertieA(3,3) = systeme.AutoA.Masse * (systeme.AutoA.Largeur^2 + systeme.AutoA.Longueur^2) / 12;
    
    InertieB = [1 0 0 ; 0 1 0; 0 0 1];
    InertieB(1,1) = systeme.AutoB.Masse * (systeme.AutoB.Hauteur^2 + systeme.AutoB.Largeur^2) / 12;
    InertieB(2,2) = systeme.AutoB.Masse * (systeme.AutoB.Hauteur^2 + systeme.AutoB.Longueur^2) / 12;
    InertieB(3,3) = systeme.AutoB.Masse * (systeme.AutoB.Largeur^2 + systeme.AutoB.Longueur^2) / 12;
    
    %Facteur Ga et Gb
    Ga = dot(normale,  InertieA \ (cross(cross(rAp, normale), rAp))');
    Gb = dot(normale,  InertieB \ (cross(cross(rBp, normale), rBp))');
    
    %Vitesse relative avant
    vitesseRelativeAvant = dot(normale, vAp - vBp);
    
    %Facteur j
    e = 0.8;
    alpha = 1 / ((1 / systeme.AutoA.Masse) + (1 / systeme.AutoB.Masse) + Ga + Gb);
    j = -alpha * (1 + e) * vitesseRelativeAvant;
    
    %Vitesses Angulaire Finales    
    wAf = systeme.AutoA.VitesseAngulaire + (j * ( InertieA \ (cross(rAp, normale)') ));
    wBf = systeme.AutoB.VitesseAngulaire - (j * ( InertieB \ (cross(rBp, normale)') ));

    %Vitesses Finales
    vAf = vAp + j * ((normale / systeme.AutoA.Masse) + cross((InertieA \ cross(rAp, normale)'), rAp));
    vBf = vBp - j * ((normale / systeme.AutoB.Masse) + cross((InertieB \ cross(rBp, normale)'), rBp));
    
    vaf = [vAf(1, 1:2) wAf(3)];
    vbf = [vBf(1, 1:2) wBf(3)];
    
end