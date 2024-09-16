function estEnCollision = Collision(balle, plan)
    estEnCollision = false;
    
    dist = abs(plan.DistanceAuPoint(balle.CentreDeMasse));
    if (dist <= balle.Rayon && plan.RespecteBornesAvecTolerance(balle.CentreDeMasse, balle.Rayon)) 
        %prendre en compte que le cm n'est pas le point de contact... il y a donc une marge
        estEnCollision = true;
    end
    
end