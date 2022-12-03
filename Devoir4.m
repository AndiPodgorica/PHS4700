function [xi yi zi face]=Devoir4(Robs,nint,next)
R=8; %Rayon du sphere (cm)
MoinsRobs=-Robs;
face=[];
d=0;
nbrSeparationTheta=250;
nbrSeparationPhi=500;
[thetaMin,thetaMax,theta]=calculerTheta(MoinsRobs); %Calcul de theta
[phiMin,phiMax,phi]=calculerPhi(MoinsRobs,theta); %Calcul de phi

pasTheta=(thetaMax-theta)/nbrSeparationTheta;
pasPhi=(phiMax-phi)/nbrSeparationPhi;

%Parcours du haut demi-cercle
for i=0:nbrSeparationTheta-1
    for j=0:nbrSeparationPhi-1
        theta=theta+pasTheta*i;
        phi=phiMin+pasPhi*j;
        
        omega=[sin(theta)*cos(phi) sin(theta)*sin(phi) cos(theta)];
        u=omega/norm(omega);
        disp(u);
        syms d
        eqn=(Robs(1)+d*u(1)).^2+(Robs(2)+d*u(2)).^2+(Robs(3)+d*u(3)).^2==R.^2;
        Sd=solve(eqn,d);
        disp(Sd);
    end
end
%Parcours du bas demi-cercle
% for i=0:nbrSeparationTheta-1
%     for j=0:nbrSeparationPhi-1
%     end
% end
end