function T = T_d(d)
    x = d(1);
    y = d(2);
    z = d(3);
    T = [y^2+z^2 -x*y -x*z; -y*x x^2+z^2 -y*z; -z*x -z*y x^2+y^2];
end
