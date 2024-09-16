function a = Acceleration( positionForce, force, centreMasseGlobal, momentInertie, vi )
%Acceleration Calcul l'accélération angulaire en fonction de force
%appliquée sur l'objet
%   positionForce : vecteur position d'application de la force
%   force : vecteur représentant la force
%   centreMasseGlobal : position du centre de masse de l'objet
%   momentInertie : moment d'inertie de l'objet
%   vi : vecteur (colonne) vitesse angulaire initiale de l'objet

    momentForce = MomentForce(positionForce, centreMasseGlobal, force);
    
    L = momentInertie * vi;
    a = inv(momentInertie) * (momentForce + cross(L, vi));

end

