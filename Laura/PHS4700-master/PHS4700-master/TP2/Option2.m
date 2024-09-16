function g = Option2(q0, wb)
    m_balle = 45.9/1000; %diviser par 100 pour avoir en kg
    rayon_balle = 21.35/1000; % pour avoir en m

    force = ForceGravitationnelle(m_balle) + ForceFrottement([q0(1) q0(2) q0(3)], rayon_balle);
    acc = Acceleration(force, m_balle);
    
    g = [acc(1) acc(2) acc(3) q0(1) q0(2) q0(3)];
    
end