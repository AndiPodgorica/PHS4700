function [ tau ] = MomentForce( posForce, force)
    tau = cross(posForce, force);
end