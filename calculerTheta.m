function [thetaMin,thetaMax,theta]=calculerTheta(robs)
R=8; %Rayon du sphere (cm)

deltaTheta=asin(R/norm(robs));

theta=acos(robs(3)/norm(robs));
if (sin(theta)<0)
    theta=2*pi-theta;
end

thetaMin=theta-deltaTheta;
thetaMax=theta+deltaTheta;
end