function c=QVRotation(a,b)
%
% Rotation du vecteur b par le quaternion a
%
qb=horzcat([0], b);
v1=QProduit(a,qb);
v2=QConjugue(a);
qc=QProduit(v1,v2); 
c=qc(2:4);

