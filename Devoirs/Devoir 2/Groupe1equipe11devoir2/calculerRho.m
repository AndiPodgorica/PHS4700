function Rho=calculerRho(position)
rho0=1.275; %Masse volumique initiale (kg/m3)
h0=7200; % Constante dans la formule de rho (m)
Rt=6.371e6; %Rayon de la Terre (km)

Rho=rho0*exp((Rt-norm(position))/h0);
end