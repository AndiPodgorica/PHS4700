function [r,n]=estEntre2Distances(pointsIntersection,position,direction)
point=pointsIntersection;
r=point-position;
n=dot(r,direction)/abs(dot(r,direction))*(r)/norm(r);
n=n/norm(n);
end