function [u_refracter, refracter] = gererRayonRentreEau(he, rentrerDansEau, n_in, n_out, u_direction, p) 
    rayonCylindre = 0.04;
    hauteurCylindre = 0.2;
    pcmCylindre = [0, 0, hauteurCylindre/2];

    if rentrerDansEau
        d = -1;
    else
        d = 1;
    end

    distanceHaut = abs(p(3) - he);
    distanceBas = abs(p(3));
    distanceCoter = abs(rayonCylindre - norm([(pcmCylindre(1) - p(1)), (pcmCylindre(2) - p(2))]));
    distance_minimale = min([distanceBas distanceHaut distanceCoter]);

    if distance_minimale == distanceHaut
        v = d * [0; 0; 1];
    elseif  distance_minimale == distanceBas
        v = d * [0; 0; -1];
    else
        v = d * [(p(1) - pcmCylindre(1)); (p(2) - pcmCylindre(2)); 0];
    end
    [u_refracter, refracter] = estRefracter(u_direction, v, n_in, n_out);
end