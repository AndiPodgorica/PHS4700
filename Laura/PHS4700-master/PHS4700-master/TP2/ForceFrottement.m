function force_f = ForceFrottement(v, rayon)
    C = 0.14;
    p = 1.2;
    A= pi * rayon^2;
    force_f = (-1/2) * p * C * A * norm(v) * v;
end