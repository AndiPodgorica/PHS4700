function [Fp,tau]=calculerForcePropulsion(theta)
mu=1200; %Debit massique (kg/s)
Fp=-mu*calculerVGaz(theta);

vecteurDistance=[0;0;-25];
tau=cross(vecteurDistance,Fp);
end