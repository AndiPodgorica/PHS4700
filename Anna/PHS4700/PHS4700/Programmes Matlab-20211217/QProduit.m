function c=QProduit(a,b)
%
% Produit de 2 quaternions
% 
v1=a(2:4);
v2=b(2:4);
vp=cross(v1,v2);
vecpc=a(1)*v2+b(1)*v1+vp;
c=horzcat((a(1)*b(1)-(v1*v2')),vecpc); 
