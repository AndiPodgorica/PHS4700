function [thetaMin,thetaMax,theta]=calculerTheta(moinsRobs)
R=8; %Rayon du sphere (cm)

deltaTheta=asin(R/norm(moinsRobs));

theta=acos(moinsRobs(3)/norm(moinsRobs));
if (sin(theta)<0)
    theta=2*pi-theta;
end

thetaMin=theta-deltaTheta;
thetaMax=theta+deltaTheta;
end