function [rbt, n, t] = iter(deltaT, mb, forces, xy0, vb0)
    r = [xy0;0];
    v = vb0;
    ti = 0;
    coupf = -1;
    v_max = 100;        %m/s
    i = 1;
    while(coupf == -1) %%ajouter confdition
        a = @(v) forces(v)/mb;
        v = v + a(v) * deltaT;  % vt+1 en fonction de vt
        if(norm(v) > v_max)
            vit_unit = v/norm(v);
            v = v_max * vit_unit;
        end
        r = r + v*deltaT + 0.5* a(v)*deltaT^2;
        ti = ti + deltaT;
        coupf = verif_limites(r);
        i = i + 1;
    end
    rbt = r';
    t = ti;
    n = i;
end

