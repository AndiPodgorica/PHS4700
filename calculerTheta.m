function [thetaMin,thetaMax]=calculerTheta(ro)
R=8; %Rayon du sphere (cm)
theta=atan(ro(2)/ro(1));

deltaTheta=asin(R/norm(ro));

thetaMin=theta-deltaTheta;
thetaMax=theta+deltaTheta;
end