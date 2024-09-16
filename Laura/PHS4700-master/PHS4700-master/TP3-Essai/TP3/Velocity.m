function vel = Velocity(vi, deltat, acc)
% vi is initial speed vector, acc is the acceleration vector
    vel = vi + acc*deltat;
end