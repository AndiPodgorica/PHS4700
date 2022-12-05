function [xi, yi, zi, face] = Devoir4(Robs, nint, next)

xi = [];
yi = [];
zi = [];
face = [];

problem = {};
% ---------------------------------Param ----------------------------------%
param = {};
param.R_obs = [Robs(1); Robs(2); Robs(3)];
param.n_int = nint;
param.n_ext = next;
problem.param = param;
% ---------------------------------Param ----------------------------------%
% ---------------------------------Color ----------------------------------%
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
% ---------------------------------Planes ---------------------------------%
% -------------------------------hyperParam--------------------------------%
hyperParam = {};
hyperParam.n_rayon_minimum = 1000;
hyperParam.n_rayon_minimum_debug = 20;
hyperParam.epsilon = 1e-6;
hyperParam.nRebondMax = 4;
hyperParam.ndim = 3;
problem.hyperParam = hyperParam;
% -------------------------------hyperParam--------------------------------%
% -------------------------------Sphere------------------------------------%
sphere = {};
sphere.R = 8; % cm
sphere.pos = [0; 0; 0]; % m
problem.sphere = sphere;

rayons={};

[unitaireI,unitaireJ]=calculerIJ(problem.param.R_obs);
nbrRayons=calculerNombreRayons(problem.hyperParam.n_rayon_minimum);
[nbrRayonsDirection,pas]=calculerPas(nbrRayons,problem.sphere.R);

for rayonI=-nbrRayonsDirection/2:nbrRayonsDirection/2
    for rayonJ=-nbrRayonsDirection/2:nbrRayonsDirection/2
        posCollision=calculerPosImpact(rayonI,rayonJ,pas,unitaireI,unitaireJ);
        if dot(posCollision, posCollision)<problem.sphere.R^2            
            rayon=creationRayon(problem.param.R_obs,posCollision);
            rayons{end+1}=rayon;
        end
    end
end

[finalPos faces]=tracerRayon(problem.planes,problem.sphere.R,problem.sphere.pos,problem.hyperParam.epsilon,problem.hyperParam.ndim,nint,next,rayons);

for i=1:length(finalPos)
    xi(i)=finalPos{i}(1);
    yi(i)=finalPos{i}(2);
    zi(i)=finalPos{i}(3);
    face(i)=faces{i};
end
end
