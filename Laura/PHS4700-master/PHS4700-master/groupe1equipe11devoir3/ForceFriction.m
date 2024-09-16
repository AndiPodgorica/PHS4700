function force = ForceFriction(m, v)
 %m is mass and v is velocity vector
    g =9.8;
    vel = [v(1); v(2)];
    normVel = norm(vel);
    
    if(normVel<50)
        mu = 0.15 * (1- (normVel/100));
    else
        mu = 0.075;
    end
    
    force = -mu *m *g *vel/normVel;
    
end