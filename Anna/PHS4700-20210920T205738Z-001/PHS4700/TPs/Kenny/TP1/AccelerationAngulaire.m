%%fonction calculant l'acceleration angulaire d'un systeme
%%autour de son centre de masse
%   positionDeForce : vecteur position où est appliqué la force
%   force : vecteur représentant la force sur l'objet
%   centreDeMasse : position du centre de masse de l'objet
%   momentInertie : moment d'inertie de l'objet
%   vitesseAngulaire : vecteur (colonne) de la vitesse angulaire initiale de l'objet
function accelerationAngulaire = AccelerationAngulaire( angRot, cm, momentInertie, vitesseAngulaire, forces)
            %tau(t)
			%momentDeForce = MomentForce(positionForce, centreDeMasse, force);
            positionN = [0;0;0] - cm;
            positionPG = [- (4.2 + 1.855); 3.5 + 4.2; 0] - cm;
            positionPD = [4.2 + 1.855; 3.5 + 4.2; 0] - cm;
            
            momentForceN = MomentForce(positionN, [0; 0; forces(1)]);
            momentForcePG = MomentForce(positionPG, [0; 0; forces(2)]);
            momentForcePD = MomentForce(positionPD, [0; 0; forces(3)]);
            
            momentTotal = momentForceN + momentForcePG + momentForcePD;
            
            %L(t) = I(t) * omega(t)
            momentCinetique = momentInertie * vitesseAngulaire;
            
            %Matrice de rotation
            RotX = [1, 0, 0; 0, cos(angRot), -sin(angRot); 0, sin(angRot), cos(angRot)];
            momentsRot = RotX * momentTotal;
            
            %a(t) = I(t)^-1 * (tau(t) + L(t) x omega(t)
            %accelerationAngulaire = inv(momentInertie) * (momentDeForce + cross(momentCinetique, vitesseAngulaire));
            accelerationAngulaire = inv(momentInertie) * (momentsRot + cross(momentCinetique, vitesseAngulaire));
end
        