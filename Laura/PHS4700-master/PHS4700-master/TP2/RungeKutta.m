function qs = RungeKutta(q0, wb, DeltaT, g)
    k1 = feval(g, q0, wb);
    k2 = feval(g, q0 + k1*DeltaT/2, wb);
    k3 = feval(g, q0 + k2*DeltaT/2, wb);
    k4 = feval(g, q0 + k3*DeltaT, wb);
    qs = q0 + DeltaT * (k1 + 2*k2 + 2*k3 + k4)/6;
end