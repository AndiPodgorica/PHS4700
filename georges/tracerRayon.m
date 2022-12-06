function [xi,yi,zi,faces]=tracerRayon(plans,sphereRayon,spherePos,epsilon,nbrDiminue,nint,next,rayons)
positionFinale={};
face={};

while ~isempty(rayons)
    [rayons,rayon]=enleverRayon(rayons);
    if doitRebondir(rayon)==true
        [rebondirEncore,collisionPrisme,distance,point,n,couleur,estDansLaSphere]=calculerProchainRebond(plans,sphereRayon,spherePos,rayon,epsilon,nbrDiminue);
        if collisionPrisme==true
            [distance,positionFinale,face]=determinerFace(rayon.d,distance,positionFinale,rayon.posU,rayon.posDepart,face,couleur);
        elseif rebondirEncore==true
            rayon.d=rayon.d+distance;
            [isTotalReflection,rayonRefracte]=calculerRefraction(nint,next,rayon,n,point,estDansLaSphere);
            rayons{end+1}=calculerReflexion(rayon.ligneU,rayon.c,rayon.nbrBond,rayon.posDepart,rayon.posU,rayon.d,n,point);
            if ~isTotalReflection
                rayons{end+1}=rayonRefracte;
            end
        end
    end
end
[xi,yi,zi,faces]=remplirDonnes(positionFinale,face);
end
