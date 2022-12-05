function [positionFinale,face] = tracerRayon(problem, rayons)
positionFinale={};
face={};

while ~isempty(rayons)
    [rayons,rayon]=Pop(rayons);
    if doitRebondir(rayon,problem)
        [rebond,collisionPrisme,distance,point,n,couleur,estDansLaSphere]=ProchainRebond(problem,rayon);
        if collisionPrisme==true
            [distance,positionFinale,face]=determinerFace(rayon.distance,distance,positionFinale,rayon.origin_direction,rayon.origin,face,couleur);
        elseif rebond==true
            rayon.distance=rayon.distance + distance;
            rayonReflechi=Reflect(problem,rayon,n,point);
            rayons{end+1}=rayonReflechi;
            [isTotalReflection,rayonRefracte]=Refraction(problem.param.n_int,problem.param.n_ext,rayon,n,point,estDansLaSphere);
            if ~isTotalReflection
                rayons{end+1}=rayonRefracte;
            end
        end
    end
end
end
