function rayonReflechi=calculerRayonReflechi(ur,point,couleur,nbrRebond,ptDepart,ptDepartDirection,distance)
rayonReflechi={};
rayonReflechi.distance=distance;
rayonReflechi.lignePos=point;
rayonReflechi.c=couleur;
rayonReflechi.nbrBond=nbrRebond+1;
rayonReflechi.posU=ptDepartDirection;
rayonReflechi.posDepart=ptDepart;
rayonReflechi.ligneU=ur;
end
