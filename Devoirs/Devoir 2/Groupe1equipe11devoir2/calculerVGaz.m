function Vgaz=calculerVGaz(theta)
vgaz=3.5*1000; %Vitesse ejection du carburant (km/s)
Vgaz=-vgaz*[0;sin(theta);cos(theta)];
end