function g = g(q,t)
    wb0 = [0;-45;0];
    v = q(1:3);
    r = q(4:6);
    
    
    v_max = 100;        %m/s
    
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
    forces = @(vb) G + Fv(vb) + Fm(vb);
    
    
    a = forces(v)/mb;
    
    if(norm(v) > v_max)
        vit_unit = v/norm(v);
        v = v_max * vit_unit;
    end
    
    g = [a; v];
end