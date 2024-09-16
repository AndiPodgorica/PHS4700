function g = Option1(q0, wb)
    m_balle = 45.9/1000; %diviser par 100 pour avoir en kg
    force = ForceGravitationnelle(m_balle);
    acc = Acceleration(force, m_balle);
    
    g = [acc(1) acc(2) acc(3) q0(1) q0(2) q0(3)];
    
end