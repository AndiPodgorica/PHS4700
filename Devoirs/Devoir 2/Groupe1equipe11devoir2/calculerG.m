function g=calculerG(position)
G=6.673e-11; %Constante gravitationnelle (Nm2/kg2)
Mt=5.974e24; %Masse de la terre (kg)
g=-G*Mt*(position/abs(norm(position)).^3);
end