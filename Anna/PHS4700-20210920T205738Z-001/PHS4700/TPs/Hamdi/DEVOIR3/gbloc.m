function [ g ] = gbloc( q, t )
    v = q(1:3);
    r = q(4:6);
    w = q(7:9);
    
    mbloc = 0.58;
    Abloc = 6*10^(-2);
    Sbloc = 1.2*Abloc^2;
    
    G = @(m) m*[0;0;-9.8];
    Fv = @(v,S) -S*v;
    forces = @(v,S,m) G(m) + Fv(v, S);
    
    a = forces(v, Sbloc, mbloc)/mbloc; 
    g = [a; v; w];
end