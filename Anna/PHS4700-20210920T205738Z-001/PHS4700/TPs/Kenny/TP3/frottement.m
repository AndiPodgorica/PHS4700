function g = frottement (q0, t0, auto)

    masse = auto.Masse; 
    vitesse = q0(1,1:3);
    
    vitesseScalaire = norm(vitesse);
    
    if (vitesseScalaire < 50)
        mu = 0.15 * ( 1 - (vitesseScalaire / 100));
    else
        mu = 0.075;
    end
    
    force = - mu * masse * 9.8 * (vitesse / vitesseScalaire);
    
    %F = ma
    accelerationFrottement = force / masse;
    g = [accelerationFrottement(1) accelerationFrottement(2) 0 vitesse(1) vitesse(2) 0];

end

