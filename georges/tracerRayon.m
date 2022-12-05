function [positionFinale,face]=tracerRayon(problem,rayons)
positionFinale={};
face={};

while ~isempty(rayons)
    [rayons,rayon]=enleverRayon(rayons);
    if doitRebondir(rayon,problem)==true
        [rebondirEncore,collisionPrisme,distance,point,n,couleur,estDansLaSphere]=calculerProchainRebond(problem,rayon);
        if collisionPrisme==true
            [distance,positionFinale,face]=determinerFace(rayon.distance,distance,positionFinale,rayon.origin_direction,rayon.origin,face,couleur);
        elseif rebondirEncore==true
            rayon.distance=rayon.distance+distance;
            [isTotalReflection,rayonRefracte]=calculerRefraction(problem.param.n_int,problem.param.n_ext,rayon,n,point,estDansLaSphere);
            rayons{end+1}=Reflect(problem,rayon,n,point);
            if ~isTotalReflection
                rayons{end+1}=rayonRefracte;
            end
        end
    end
end
end
