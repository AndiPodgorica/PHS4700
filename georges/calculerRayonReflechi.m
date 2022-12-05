function rayonReflechi=calculerRayonReflechi(ur,point,couleur,nbrRebond,ptDepart,ptDepartDirection,distance)
rayonReflechi={};
rayonReflechi.distance=distance;
rayonReflechi.line_point=point;
rayonReflechi.color=couleur;
rayonReflechi.nRebound=nbrRebond+1;
rayonReflechi.origin_direction=ptDepartDirection;
rayonReflechi.origin=ptDepart;
rayonReflechi.line_direction=ur;

end
