function c=QUnitaire(a)
%
% Normaliser le quaternion ˆ 1
% 
long=sqrt(a(1)^2+dot(a(2:4),a(2:4)));
c=a/long; 
