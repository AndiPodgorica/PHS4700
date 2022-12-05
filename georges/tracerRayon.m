function [positionFinale,face]=tracerRayon(plans,sphereRayon,spherePos,epsilon,nbrDiminue,nint,next,rayons)
positionFinale={};
face={};

while ~isempty(rayons)
    [rayons,rayon]=enleverRayon(rayons);
    if doitRebondir(rayon)==true
        [rebondirEncore,collisionPrisme,distance,point,n,couleur,estDansLaSphere]=calculerProchainRebond(plans,sphereRayon,spherePos,rayon,epsilon,nbrDiminue);
        if collisionPrisme==true
            [distance,positionFinale,face]=determinerFace(rayon.distance,distance,positionFinale,rayon.origin_direction,rayon.origin,face,couleur);
        elseif rebondirEncore==true
            rayon.distance=rayon.distance+distance;
            [isTotalReflection,rayonRefracte]=calculerRefraction(nint,next,rayon,n,point,estDansLaSphere);
            rayons{end+1}=calculerReflexion(rayon.line_direction,rayon.color,rayon.nRebound,rayon.origin,rayon.origin_direction,rayon.distance,n,point);
            if ~isTotalReflection
                rayons{end+1}=rayonRefracte;
            end
        end
    end
end
end
