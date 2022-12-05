function [a,b,c]=fonctionQuadratique(rayon,point,direction)
a=direction(1)^2+direction(2)^2+direction(3)^2;
b=2*(point(1)*direction(1)+point(2)*direction(2)+point(3)*direction(3));
c=point(1)^2+point(2)^2+point(3)^2-rayon^2;
end
