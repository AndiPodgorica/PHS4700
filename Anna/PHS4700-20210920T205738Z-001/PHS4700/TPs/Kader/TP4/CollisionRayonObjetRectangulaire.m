function [point, couleur, surface] = CollisionRayonObjetRectangulaire(r0, rt)
    %r0: point d attache de la droite; rt: vecteur directeur de la droite;
    
    cub= Cubid([0;0;0]);
    distance = inf;
    point = [NaN;NaN;NaN]
    couleur = ""
    surface = NaN
    
    for i = 1:6
        [A, B, C, D, clr] =cub.Surface(i);
        [p, emp] = CollisionRayonRectangle(r0,rt,A,B,C,D);
        if emp ~= "out"
            distanceNew = norm (p - r0)
            if distanceNew < distance
                distance = distanceNew;
                point = p;
                couleur = clr;
                surface = i;
        end
    end
end