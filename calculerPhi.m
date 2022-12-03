function [phiMin,phiMax,phi]=calculerPhi(robs,theta)
R=8; %Rayon du sphere (cm)

deltaPhi=asin(R/norm(robs));

phi=asin((robs(2)/norm(robs))/sin(theta));
if (cos(phi)<0)
    phi=pi-phi;
end

phiMin=phi-deltaPhi;
phiMax=phi+deltaPhi;
end