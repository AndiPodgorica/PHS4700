function [ output_args ] = Rotation( angleX, angleY, angleZ )
%Retourne la matrice de rotation selon les 3 angles fournis
mX = GetMatriceRotationX(angleX);
mY = GetMatriceRotationY(angleY);
mZ = GetMatriceRotationZ(angleZ);

output_args = mZ*mY*mX;

end