function [ output_args ] = GetMatriceRotationX( angle )
%Retourne la matrice de rotation en X selon l'angle fourni
matRot = [1 0 0 ;0 1 0;0 0 1];

matRot(2,2) = cos(angle);
matRot(3,3) = matRot(2,2);

matRot(3,2) = sin(angle);
matRot(2,3) = -sin(angle);

output_args = matRot;

end