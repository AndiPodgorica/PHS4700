function rayonRefracte=refractionRayon(ut,point,rayon)
rayonRefracte = {};
rayonRefracte.posDepart=rayon.posDepart;
rayonRefracte.lignePos=point;
rayonRefracte.c=rayon.c;
rayonRefracte.nbrBond=rayon.nbrBond+1;
rayonRefracte.posU=rayon.posU;
rayonRefracte.d=rayon.d;
rayonRefracte.ligneU=ut;
end
