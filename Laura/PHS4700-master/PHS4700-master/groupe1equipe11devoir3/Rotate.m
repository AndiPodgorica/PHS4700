function rotate = Rotate(angle, matrix)
    rotationMatrix = [cos(angle) -sin(angle); sin(angle) cos(angle)];
    rotate = transpose(rotationMatrix * transpose(matrix));
end