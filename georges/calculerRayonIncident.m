function copie=calculerRayonIncident(point,rayon)
copie={};
copie.line_point = point;
copie.origin = rayon.origin;
copie.origin_direction = rayon.origin_direction;
copie.distance = rayon.distance;
copie.nRebound = rayon.nRebound;
copie.color = rayon.color;
copie.line_direction = rayon.line_direction;
end