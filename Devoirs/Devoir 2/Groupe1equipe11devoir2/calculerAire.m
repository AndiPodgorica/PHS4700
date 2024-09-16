function A=calculerAire(alpha)
H=53; %Hauteur totale de la fusee (m)
R=1.8; %Rayon fusee (m)
A=pi*R*R*abs(cos(alpha))+2*R*H*abs(sin(alpha));
end