function [ g ] = gballe( q, t )
    v = q(1:3);
    r = q(4:6);
    
    mballe = 70*10^(-3);    %kg
    Rballe = 2*10^(-2);       %m
    Sballe = pi* Rballe^2;
    
    G = @(m) m*[0;0;-9.8];
    Fv = @(v,S) -S*v;
    forces = @(v,S,m) G(m) + Fv(v, S);
    
    a = forces(v, Sballe, mballe)/mballe; 
    g = [a; v];
end

