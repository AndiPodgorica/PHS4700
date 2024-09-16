function [nbrRayonsDirection,pas]=calculerPas(nbrRayons,rayon)
nbrRayonsDirection=sqrt(nbrRayons);
pas=(2*rayon)/nbrRayonsDirection;
end