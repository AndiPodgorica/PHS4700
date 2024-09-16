function c=QRotation(a,b)
%
% Rotation du quaternion b par a
% 
v1=QProduit(a,b);
v2=QConjugue(a);
c=QProduit(v1,v2); 
