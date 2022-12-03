function [phiMin,phiMax,phi]=calculerPhi(moinsRobs,theta)
R=8; %Rayon du sphere (cm)

deltaPhi=asin(R/norm(moinsRobs));
argument=moinsRobs(1)/norm(moinsRobs);
phi=acos(argument/sin(theta));
if (cos(phi)<0)
    phi=pi-phi;
end

phiMin=phi-deltaPhi;
phiMax=phi+deltaPhi;
end