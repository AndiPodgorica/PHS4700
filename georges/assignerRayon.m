function rayonRefraction=assignerRayon(ut,point,rayon)
rayonRefraction={};
rayonRefraction.directionTransmis=ut;
rayonRefraction.pointCollision=point;
rayonRefraction.face=rayon.face;
rayonRefraction.nbrRebond=rayon.nbrRebond;
rayonRefraction.pointDepart=rayon.pointDepart;
rayonRefraction.direction=rayon.direction;
rayonRefraction.distanceParcourue=rayon.distanceParcourue;
end