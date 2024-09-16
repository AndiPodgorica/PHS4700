function g = calculBoite (q, balle)
%
% Exemple en 3-D.
% Valeur differente de k dans chaque direction .
% Acceleration et vitesse pour resolution
% approximative des equations de la cinematique
% q0: vecteur initial temps , vitesse , position
% g : vecteur initial 1, accélération , vitesse
%
f = Calculs.gravite(balle);
f = f + Calculs.visqueuxBalle(balle, q(2:4));
a = f / balle.Masse;
vi = [q(2) q(3) q(4)];
v = Calculs.vitesse(vi, a, q(1));
g =[q(1) a v];