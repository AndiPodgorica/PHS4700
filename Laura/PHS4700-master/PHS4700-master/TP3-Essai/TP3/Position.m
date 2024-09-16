function pos = Position(xi, v, acc, deltat)
% xi is initial position vector, v is velocity vector, acc is acceleration
% vector
    pos = xi + v*deltat - 0.5*acc*(deltat^2);
end