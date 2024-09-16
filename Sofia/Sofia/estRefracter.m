function [u_refracter, est_refracter] = estRefracter(u_direction, v, n_in, n_out)
    u = v/norm(v);  
    u_direction = u_direction/norm(u_direction);
    j = cross(u_direction, u)/norm(cross(u_direction, u));
    k = cross(u, j);
    est_reflexion  = (dot(k, u_direction)*(n_in/n_out) > 1);
    if est_reflexion
        u_refracter = u_direction - 2 * u * dot(u_direction, u);
        u_refracter = u_refracter/norm(u_refracter);
        est_refracter = false; 
    else 
        u_refracter = dot(k, u_direction)*(n_in/n_out)*k - u*(sqrt(1-((dot(k, u_direction)*(n_in/n_out))^2)));
        est_refracter = true;
    end
end