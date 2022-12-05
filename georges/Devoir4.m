function [xi, yi, zi, face] = Devoir4(Robs, nint, next)
color = {};
color.cyan = 1;
color.blue = 2;
color.orange = 3;
color.red = 4;
color.magenta = 5;
color.green = 6;
problem.color = color;
% ---------------------------------Color ----------------------------------%
% -------------------------------Box---------------------------------------%
box = {};
box.a = 4; % cm
box.b = 2; % cm
box.c = 4; % cm
box.pos = [0; 2; 0]; % cm

problem.box = box;
% -------------------------------Box---------------------------------------%
% ---------------------------------Planes ---------------------------------%
plane_1 = {};
plane_1.color = color.cyan;
plane_1.plane_normal = [-1; 0; 0];
plane_1.plane_distance = box.a/2;
plane_1.plane_domaine_lower_bound = [-box.a/2; -box.b/2; 0];
plane_1.plane_domaine_upper_bound = [-box.a/2; box.b/2; box.c];

plane_2 = {};
plane_2.color = color.blue;
plane_2.plane_normal = [1; 0; 0];
plane_2.plane_distance = box.a/2;
plane_2.plane_domaine_lower_bound = [box.a/2; -box.b/2; 0];
plane_2.plane_domaine_upper_bound = [box.a/2; box.b/2; box.c];

plane_3 = {};
plane_3.color = color.orange;
plane_3.plane_normal = [0; -1; 0];
plane_3.plane_distance = box.b/2;
plane_3.plane_domaine_lower_bound = [-box.a/2; -box.b/2; 0];
plane_3.plane_domaine_upper_bound = [box.a/2; -box.b/2; box.c];

plane_4 = {};
plane_4.color = color.red;
plane_4.plane_normal = [0; 1; 0];
plane_4.plane_distance = box.b/2;
plane_4.plane_domaine_lower_bound = [-box.a/2; box.b/2; 0];
plane_4.plane_domaine_upper_bound = [box.a/2; box.b/2; box.c];

plane_5 = {};
plane_5.color = color.magenta;
plane_5.plane_normal = [0; 0; -1];
plane_5.plane_distance = 0;
plane_5.plane_domaine_lower_bound = [-box.a/2; -box.b/2; 0];
plane_5.plane_domaine_upper_bound = [box.a/2; box.b/2; 0];

plane_6 = {};
plane_6.color = color.green;
plane_6.plane_normal = [0; 0; 1];
plane_6.plane_distance = box.c;
plane_6.plane_domaine_lower_bound = [-box.a/2; -box.b/2; box.c];
plane_6.plane_domaine_upper_bound = [box.a/2; box.b/2; box.c];

planes = {plane_1, plane_2, plane_3, plane_4, plane_5, plane_6};
problem.planes = planes;


rayons={};
Robs=[Robs(1);Robs(2);Robs(3)];
[unitaireI,unitaireJ]=calculerIJ(Robs);
nbrRayons=calculerNombreRayons(1000);
[nbrRayonsDirection,pas]=calculerPas(nbrRayons,8);

for rayonI=-nbrRayonsDirection/2:nbrRayonsDirection/2
    for rayonJ=-nbrRayonsDirection/2:nbrRayonsDirection/2
        posCollision=calculerPosImpact(rayonI,rayonJ,pas,unitaireI,unitaireJ);
        if dot(posCollision, posCollision)<64            
            rayon=creationRayon(Robs,posCollision);
            rayons{end+1}=rayon;
        end
    end
end

[xi,yi,zi,face]=tracerRayon(problem.planes,8,[0;0;0],1e-6,3,nint,next,rayons);
end
