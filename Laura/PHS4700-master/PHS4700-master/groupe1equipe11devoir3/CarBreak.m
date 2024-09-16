function g = CarBreak(qi, car)
 % Deuxieme fonction appeler par Runge Kutta qui calcule l'auto qui
 % break sur la glace
    vi = [qi(1) qi(2)];
    
    if(car == 1) % auto a
        m = 1540;
    elseif (car == 2) % auto b
        m = 1010;
    else
        error('not a good car selection');
    end
    
    F = ForceFriction(m, vi);
    acc = Acceleration(F, m);
    
    % g = [acc_x, acc_y, v_x, v_y]
    g = [acc(1) acc(2) vi(1) vi(2)];
    
end