function rayon=creationRayon(posObservateur,posCollision)
rayon={};

rayon.distance=0;
rayon.nRebound=0;
rayon.color=nan;
rayon.origin=posObservateur;
rayon.origin_direction=posCollision-posObservateur;
rayon.line_direction=posCollision-posObservateur;
rayon.line_direction=rayon.line_direction/norm(rayon.line_direction);
rayon.line_point=posObservateur;
rayon.origin_direction=rayon.origin_direction/norm(rayon.origin_direction);
end