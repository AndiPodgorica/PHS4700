function posCollision=calculerPosImpact(rayonI,rayonJ,pas,unitaireI,unitaireJ)
t=rayonI*pas;
u=rayonJ*pas;
posCollision=t*unitaireI+u*unitaireJ;
end