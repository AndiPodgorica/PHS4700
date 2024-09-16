function g = g1 (q0, balle)
%
% Exemple en 3-D.
% Valeur differente de k dans chaque direction .
% Acceleration et vitesse pour resolution
% approximative des equations de la cinematique
% q0: vecteur initial temps , vitesse , position
% g : vecteur initial 1, accélération , vitesse
%
f = Calculs.gravite(balle);
a = f / balle.Masse;
g =[q0(1) a q0(2) q0(3) q0(4)+a(3) * q0(1)];