function [xi yi zi face]=Devoir4(Robs,nint,next)
[thetaMin,thetaMax]=calculerTheta(Robs);
phiMin=0;
phiMax=2*pi;

R=8;
deplacement=0.005;

pasTheta=(thetaMax-thetaMin)/400;
pasPhi=(phiMax-phiMin)/400;

iRes=1;

face=[1];

for theta=thetaMin:pasTheta:thetaMax %Theta
    for phi=phiMin:pasPhi:phiMax %Phi
        distance=0;
        
        vDirecteur=[sin(theta)*cos(phi) sin(theta)*sin(phi) cos(theta)];
        u=vDirecteur/norm(vDirecteur); %Calculer vecteur directeur du rayon
        
        point=Robs;
        toucheSphere=false;
        while(toucheSphere==false)
            point=point+deplacement*u;
            distance=distance+deplacement;
            disp(u);
        end
        xi=[];
        yi=[];
        zi=[];
        face=[];
    end
end
end