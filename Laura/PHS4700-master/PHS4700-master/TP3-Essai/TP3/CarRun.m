function g = CarRun(qi, car)
 % Une des deux fonction appeler par Runge Kutta qui calcule l'auto qui
 % roule sur la glace
 
    % g = [acc_x, acc_y, v_x, v_y]
    g = [0 0 qi(1) qi(2)];
    
end