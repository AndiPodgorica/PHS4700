function[rayonRefracte] = refractionRayon(Ut, point, rayon)

rayonRefracte = {};

rayonRefracte.line_direction = Ut;
rayonRefracte.line_point = point;
rayonRefracte.color = rayon.color;
rayonRefracte.nRebound = rayon.nRebound + 1;
rayonRefracte.origin = rayon.origin;
rayonRefracte.origin_direction = rayon.origin_direction;
rayonRefracte.distance = rayon.distance;
end
