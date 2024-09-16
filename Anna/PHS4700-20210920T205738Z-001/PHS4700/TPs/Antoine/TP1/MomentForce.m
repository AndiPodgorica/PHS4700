function [ tau ] = MomentForce( pointApplication, centreMasse, force)
%MomentForce Calcul le moment de force causé par une force a un point p
%   pointApplication : point auquel on applique une force
%   centreMasse : centre de masse de l'objet auquel on applique la force
%   force : vecteur force appliqué
    
    tau = cross((pointApplication - centreMasse), force);
end

