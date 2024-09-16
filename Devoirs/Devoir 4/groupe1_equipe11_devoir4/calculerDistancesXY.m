function [distanceX,distanceY]=calculerDistancesXY(a,b,c)
distanceX=(-b+sqrt(b^2-4*a*c))/(2*a);
distanceY=(-b-sqrt(b^2-4*a*c))/(2*a);
end