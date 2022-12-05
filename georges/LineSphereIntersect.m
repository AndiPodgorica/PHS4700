function [intersection,distances,pointspointsIntersection]=LineSphereIntersect(rayon,point,direction)
pointspointsIntersection={};
distances={};
[a,b,c]=fonctionQuadratique(rayon,point,direction);
if b^2-4*a*c>0
    intersection=true;
    [distanceX,distanceY]=calculerDistancesXY(a,b,c);
    distances={distanceX,distanceY};
    pointspointsIntersection={point+distanceX/(2*a)*direction,point+distanceY/(2*a)*direction};
elseif b^2-4*a*c==0
    intersection=true;
    distances={-b/(2*a)};
    pointspointsIntersection={point+distances{1}*direction};
else
    intersection=false;
end
end
