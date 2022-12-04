function [totalReflection,refracted_ray] = calculerRefraction(problem, ray, n, point, isEnteringSphere)

refracted_ray={};
totalReflection=false;

i=n/norm(n);
ui=ray.directionTransmis/norm(ray.line_direction);

if isEnteringSphere
    ni=problem.param.next;
    nt=problem.param.nint;
else
    ni=problem.param.nint;
    nt=problem.param.next;
end

if ni>nt
    if asin(nt/ni)<acos(dot(i,ui))
        totalReflection=true;
        return;
    end
end

j=cross(ui,i)/norm(cross(ui,i));
k=cross(i,j)/norm(cross(i,j));

st=ni/nt*dot(k, ui);

ut=-i*s/qrt(1-st^2)+k*st;

refracted_ray=assignerRayon(ut,point,ray));

% refracted_ray.directionTransmis=ut;
% refracted_ray.pointCollision=point;
% refracted_ray.face=ray.face;
% refracted_ray.nbrRebond=ray.nbrRebond;
% refracted_ray.pointDepart=ray.pointDepart;
% refracted_ray.direction=ray.direction;
% refracted_ray.distanceParcourue=ray.distanceParcourue;

end
