function RotZ = MatriceRotationZ(angRot)
    RotZ = [cos(angRot), -sin(angRot), 0; sin(angRot), cos(angRot), 0; 0, 0, 1];
end