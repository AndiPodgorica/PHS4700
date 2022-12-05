function [distance,point,r,n]=estEntre2Distances(distances,pointsIntersection,position,direction)
point=pointsIntersection;
distance=distances;
r=point-position;
n=dot(r,direction)/abs(dot(r,direction))*(r)/norm(r);
n=n/norm(n);
end