function g = CarRun(qi, car)
 % Une des deux fonction appeler par Runge Kutta qui calcule l'auto qui
 % roule sur la glace

    % vecteur vitesse 
    vi = [qi(1) qi(2)];
    
    % g = [acc_x, acc_y, v_x, v_y, alpha_z, w_z]
    g = [0 0 vi(1) vi(2)];
    
end