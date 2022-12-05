function rayonRefracte=refractionRayon(ut,point,rayon)
rayonRefracte = {};

rayonRefracte.origin=rayon.origin;
rayonRefracte.line_point=point;
rayonRefracte.color=rayon.color;
rayonRefracte.nRebound=rayon.nRebound+1;
rayonRefracte.origin_direction=rayon.origin_direction;
rayonRefracte.distance=rayon.distance;
rayonRefracte.line_direction=ut;
end
