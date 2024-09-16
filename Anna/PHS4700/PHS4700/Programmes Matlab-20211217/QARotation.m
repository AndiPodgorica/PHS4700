function vrotation=QARotation(v,theta,u)
%
% Rotation du vecteur v par theta autour de u
%
qv=horzcat([0],v);
qr=horzcat(cos(theta/2),sin(theta/2)*u);
v1=QProduit(qr,qv);
v2=QConjugue(qr);
qc=QProduit(v1,v2); 
vrotation=qc(2:4);

