function [ output_args ] = GetMatriceRotationY( angle )
%Retourne la matrice de rotation en Y selon l'angle fourni
matRot = [1 0 0 ;0 1 0;0 0 1];

matRot(1,1) = cos(angle);
matRot(3,3) = matRot(1,1);

matRot(1,3) = sin(angle);
matRot(3,1) = -sin(angle);

output_args = matRot;

end