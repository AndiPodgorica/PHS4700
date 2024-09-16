function [minTheta, maxTheta]= calculerTheta(rayonCylindre, Robs, pcmCylindre, hauteurPaille)
    r_obs_verre = [pcmCylindre(1) - Robs(1), pcmCylindre(2) - Robs(2)];
    A1 = [norm(r_obs_verre) + rayonCylindre, pcmCylindre(3) - Robs(3) + (hauteurPaille/2) ];
    A2 = [norm(r_obs_verre) + rayonCylindre, pcmCylindre(3) - Robs(3) - (hauteurPaille/2) ];
    A3 = [norm(r_obs_verre) - rayonCylindre, pcmCylindre(3) - Robs(3) - (hauteurPaille/2) ];
    A4 = [norm(r_obs_verre) - rayonCylindre, pcmCylindre(3) - Robs(3) + (hauteurPaille/2) ];
    possible_theta = [acos(A1(2)/ norm(A1)), acos(A2(2)/norm(A2)), acos(A3(2)/norm(A3)), acos(A4(2)/norm(A4))];   
    minTheta = min(possible_theta);
    maxTheta = max(possible_theta);

end