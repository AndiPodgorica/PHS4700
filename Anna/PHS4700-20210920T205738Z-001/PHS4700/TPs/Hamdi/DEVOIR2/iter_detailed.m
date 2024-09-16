function [t, rbt, vbf, coup] = iter_detailed(deltaT, mb, forces, xy0, vb0, n)
    r = [xy0;0];
    rbf = zeros(n,3);
    rbf(1,:) = r;
    v = vb0;
    tf = zeros(n,1);
    coupf = -1;
    v_max = 100;        %m/s
    i = 1;
    while(coupf == -1)
        i = i + 1;
        a = @(v) forces(v)/mb;
        v = v + a(v) * deltaT;  % vt+1 en fonction de vt
        if(norm(v) > v_max)
            vit_unit = v/norm(v);
            v = v_max * vit_unit;
        end
        r = r + v*deltaT + 0.5* a(v)*deltaT^2;
        rbf(i,:) = r;
        tf(i) = tf(i-1)+deltaT;
        coupf = verif_limites(r);
    end
    rbt = rbf;
    t = tf;
    coup = coupf;
    vbf = v;
end

