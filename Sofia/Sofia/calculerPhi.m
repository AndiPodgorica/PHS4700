function [minPhi, maxPhi]= calculerPhi(rayonCylindre, Robs, pcmCylindre)
    r_obs_verre = [pcmCylindre(1) - Robs(1) , pcmCylindre(2) - Robs(2)];  
    if r_obs_verre(2) ~= 0
        phi = atan(r_obs_verre(2)/(r_obs_verre(1)));
    elseif norm(r_obs_verre) == 0
        phi = 0;
    else 
        phi = acos(r_obs_verre(1)/norm(r_obs_verre));
    end     
    delta_phi = asin(rayonCylindre/norm(r_obs_verre));
    minPhi = min(phi - delta_phi);
    maxPhi = max(phi + delta_phi);

end