function [xi,yi,zi,face]=Devoir4(Robs,nint,next)
R=8; %Rayon du sphere (cm)
isCollision=false;
nbrImpact=0;
MoinsRobs=-Robs;
face=[];
d=0;
nbrSeparationTheta=50;
nbrSeparationPhi=50;
[thetaMin,thetaMax,theta]=calculerTheta(MoinsRobs); %Calcul de theta
[phiMin,phiMax,phi]=calculerPhi(MoinsRobs,theta); %Calcul de phi

pasTheta=(thetaMax-theta)/nbrSeparationTheta;
pasPhi=(phiMax-phiMin)/nbrSeparationPhi;

noRayon=1;
%Parcours du haut demi-cercle
for i=0:nbrSeparationTheta
    for j=0:nbrSeparationPhi
        thetaCourant=theta+pasTheta*i;
        phiCourant=phiMin+pasPhi*j;
        omega=[sin(thetaCourant)*cos(phiCourant) sin(thetaCourant)*sin(phiCourant) cos(thetaCourant)];
        u=omega/norm(omega);
        
        d=calculerDistanceD(MoinsRobs,u);
        k=d*u;
        %         xi(noRayon)=k(1);
        %         yi(noRayon)=k(2);
        %         zi(noRayon)=k(3);
        %         face(noRayon)=5;
        if d~=1 %Refraction
            isCollision=true;
            [ut,reflectionInterne]=calculerRefraction(k,Robs,nint,next);
            
            if reflectionInterne==false %1er reflection
                nbrCollision=nbrCollision+1;
                d=d+calculerDistanceD(MoinsRobs,ut);
                k=d*ut;
                
                ui=calculerReflexion(ut,k);
            end
        end
        
        
        
        
        j=j+1;
        noRayon=noRayon+1;
    end
    i=i+1;
end

for i=0:nbrSeparationTheta
    for j=0:nbrSeparationPhi
        thetaCourant=theta-pasTheta*i;
        phiCourant=phiMin+pasPhi*j;
        omega=[sin(thetaCourant)*cos(phiCourant) sin(thetaCourant)*sin(phiCourant) cos(thetaCourant)];
        u=omega/norm(omega);
        
        d=calculerDistanceD(MoinsRobs,u);
        
        
        k=d*u;
        xi(noRayon)=k(1);
        yi(noRayon)=k(2);
        zi(noRayon)=k(3);
        face(noRayon)=5;
        
        j=j+1;
        noRayon=noRayon+1;
    end
    i=i+1;
end
end