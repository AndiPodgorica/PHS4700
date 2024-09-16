function Fvis=calculerFrottement(vitesse, position,positionAngulaireX)
Cvis=0.5; %Coefficient de trainee

alpha=trouverAlpha(vitesse,positionAngulaireX);
A=calculerAire(alpha);
Rho=calculerRho(position);

Fvis=-1/2*A*Rho*Cvis*norm(vitesse)*vitesse;
end