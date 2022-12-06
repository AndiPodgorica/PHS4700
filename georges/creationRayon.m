function rayon=creationRayon(posObservateur,posCollision)
rayon={};
rayon.d=0;
rayon.c=nan;
rayon.nbrBond=0;
rayon.posDepart=posObservateur;
rayon.posU=posCollision-posObservateur;
rayon.ligneU=posCollision-posObservateur;
rayon.ligneU=rayon.ligneU/norm(rayon.ligneU);
rayon.lignePos=posObservateur;
rayon.posU=rayon.posU/norm(rayon.posU);
end