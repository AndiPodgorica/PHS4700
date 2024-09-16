function g=fonctionG(q0,t0,masse,theta)
vitesseCM=[q0(1);q0(2);q0(3)];
positionCM=[q0(4);q0(5);q0(6)];
vitesseAngulaireX=q0(7);
positionAngulaireX=q0(8);

matriceRotationOX=[1 0 0;0 cos(positionAngulaireX) -sin(positionAngulaireX);0 sin(positionAngulaireX) cos(positionAngulaireX)];

%Calcul de l'acceleration lineaire
[FpL,tauL]=calculerForcePropulsion(theta);
    if masse == 20000
        forcePropulsionG=[0,0,0];
    else
        forcePropulsionG=matriceRotationOX*FpL;
    end
forceGravitationnelle=calculerForceGravitationnelle(masse, positionCM);
forceFrottement=calculerFrottement(vitesseCM,positionCM,positionAngulaireX);

sommeDesForces=forcePropulsionG+forceGravitationnelle+forceFrottement;
accLineaire=sommeDesForces/masse;

%Calcul de l'acceleration tangentielle
momentInertieL=trouverMomentInertie(masse);
momentInertieG=matriceRotationOX*momentInertieL;
tauG=matriceRotationOX*tauL;
accAngulaire=inv(momentInertieG)*[tauG(1);tauG(2);tauG(3)];

g=[accLineaire(1) accLineaire(2) accLineaire(3) vitesseCM(1) vitesseCM(2) vitesseCM(3) accAngulaire(1) vitesseAngulaireX];

end