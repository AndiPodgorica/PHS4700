function posCollision=calculerPosImpact(rayonI,rayonJ,pas,unitaireI,unitaireJ)
posCollision=rayonI*pas*unitaireI+rayonJ*pas*unitaireJ;
end