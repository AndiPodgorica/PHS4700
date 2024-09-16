function moment=trouverMomentInertie(masse)
H=53; %Hauteur totale de la fusee (m)
R=1.8; %Rayon fusee (m)

Ixx=(masse*R*R)/4+(masse*H*H)/12;
Iyy=(masse*R*R)/4+(masse*H*H)/12;
Izz=(masse*R*R)/2;

moment=[Ixx 0 0;0 Iyy 0;0 0 Izz];
end