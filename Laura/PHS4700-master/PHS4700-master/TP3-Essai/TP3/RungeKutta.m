function qs = RungeKutta(q0, car, DeltaT, g)
    k1 = feval(g, q0, car);
    k2 = feval(g, q0 + k1*DeltaT/2, car);
    k3 = feval(g, q0 + k2*DeltaT/2, car);
    k4 = feval(g, q0 + k3*DeltaT, car);
    qs = q0 + DeltaT * (k1 + 2*k2 + 2*k3 + k4)/6;
end