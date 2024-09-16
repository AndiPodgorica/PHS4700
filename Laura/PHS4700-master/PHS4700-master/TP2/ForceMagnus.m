function magnus = ForceMagnus(v, wb, rayon)
    C = 0.000791 * norm(wb);
    A= pi * rayon^2;
    p = 1.2;
    wb_v = cross(wb, v);
    magnus = (1/2) * p * C * A * ((norm(v))^2) * (wb_v/norm(wb_v));
end