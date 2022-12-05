function incident=calculerRayonIncident(point,rayon)
incident={};
incident.origin = rayon.origin;
incident.line_direction = rayon.line_direction;
incident.nRebound = rayon.nRebound;
incident.line_point = point;
incident.color = rayon.color;
incident.distance = rayon.distance;
incident.origin_direction = rayon.origin_direction;
end