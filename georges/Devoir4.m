function [xi,yi,zi,face]=Devoir4(Robs,nint,next)
R=8; %Rayon du sphere
min=3;
nbrRayons=1000;
incertitude=0.000001; %Incertitude de collision
sphereCM=[0;0;0];

plans=creerPlans();
rayons={};
Robs=[Robs(1);Robs(2);Robs(3)];
[unitaireI,unitaireJ]=calculerIJ(Robs);
nbrRayons=calculerNombreRayons(nbrRayons);
[nbrRayonsDirection,pas]=calculerPas(nbrRayons,R);

for rayonI=-nbrRayonsDirection/2:nbrRayonsDirection/2
    for rayonJ=-nbrRayonsDirection/2:nbrRayonsDirection/2
        posCollision=calculerPosImpact(rayonI,rayonJ,pas,unitaireI,unitaireJ);
        if dot(posCollision,posCollision)<R*R            
            rayon=creationRayon(Robs,posCollision);
            rayons{end+1}=rayon;
        end
    end
end
[xi,yi,zi,face]=tracerRayon(plans,R,sphereCM,incertitude,min,nint,next,rayons);
end
