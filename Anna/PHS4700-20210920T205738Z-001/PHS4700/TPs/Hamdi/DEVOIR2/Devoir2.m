function [coup, vbf, t, rbt] = Devoir2(option,xy0,vb0,wb0)
    deltaT0 = 4;
    precision = 0.001;
    
    mb = 45.9*10^(-3);   %kg
    Rb = 21.35*10^(-3);  %m
    rho = 1.2;           %kg/m3
    A = pi*Rb^2;         %m2
    Cv = 0.14;
    Cm = 0.000791*norm(wb0);
    % les forces
    G = mb*[0;0;-9.8];
    Fv = @(vb) -0.5*rho*Cv*A*norm(vb)*vb;
    Fm = @(vb) 0.5*rho*Cm*A*norm(vb)^2*cross(wb0, vb)/norm(cross(wb0, vb));
    forces = @(vb) G;
    if option >= 2
        forces = @(vb) forces(vb) + Fv(vb);
    end
    if option == 3
        forces =  @(vb) forces(vb) + Fm(vb);
    end
    
    %controle d'erreur
    deltaT = @(m) deltaT0 / 2^(m-1);
    [rbt_1, ~, ~] = iter(deltaT(1), mb, forces, xy0, vb0);
    [rbt_2, n, ~] = iter(deltaT(2), mb, forces, xy0, vb0);
    m=2;
    while(norm(rbt_2 - rbt_1) > precision)
        [rbt_1, ~, ~] = iter(deltaT(m), mb, forces, xy0, vb0);
        m = m + 1;
        [rbt_2, n, ~] = iter(deltaT(m), mb, forces, xy0, vb0);
    end
        
    %simulation
    [t, rbt, vbf, coup] = iter_detailed(deltaT(m), mb, forces, xy0, vb0, n);
end



