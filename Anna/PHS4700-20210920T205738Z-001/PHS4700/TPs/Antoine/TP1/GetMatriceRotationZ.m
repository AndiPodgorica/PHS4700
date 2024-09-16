function [ output_args ] = GetMatriceRotationZ( angle )
%Retourne la matrice de rotation en Z selon l'angle fourni
matRot = [1 0 0 ;0 1 0;0 0 1];

matRot(1,1) = cos(angle);
matRot(2,2) = matRot(1,1);

matRot(1,2) = -sin(angle);
matRot(2,1) = sin(angle);

output_args = matRot;

end