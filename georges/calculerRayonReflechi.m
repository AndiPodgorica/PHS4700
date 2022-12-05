function rayonReflechi=calculerRayonReflechi(ur,point,couleur,nbrRebond,ptDepart,ptDepartDirection,distance)
rayonReflechi={};
rayonReflechi.line_direction=ur;
rayonReflechi.line_point=point;
rayonReflechi.color=couleur;
rayonReflechi.nRebound=nbrRebond+1;
rayonReflechi.origin=ptDepart;
rayonReflechi.origin_direction=ptDepartDirection;
rayonReflechi.distance=distance;
end
