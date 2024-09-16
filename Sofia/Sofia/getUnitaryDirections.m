function [u_directions]= getUnitaryDirections(minTheta, maxTheta, minPhi, maxPhi)
    u_directions = [];
    N = 200;
    K = 100;
    for i = 1:N
        for j = 1:K       
            theta = minTheta + ((maxTheta - minTheta)/(2*N))*(2*i-1);
            phi = minPhi + ((maxPhi - minPhi)/(2*K))*(2*j-1);
            d = [sin(theta)*cos(phi); sin(theta)*sin(phi); cos(theta)];
            u = d/norm(d);
            u_directions = [u_directions; transpose(u)];
        end
    end

end