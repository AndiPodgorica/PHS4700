function [RotX] = Rotation(angRot, matrice)
    %Matrice de rotation
    rotation = [1, 0, 0; 0, cos(angRot), -sin(angRot); 0, sin(angRot), cos(angRot)];
    RotX = rotation * transpose(matrice);
end