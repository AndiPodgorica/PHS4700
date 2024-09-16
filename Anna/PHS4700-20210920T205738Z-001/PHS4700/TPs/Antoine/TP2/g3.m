function g = g3 (q, balle)
%
% Exemple en 3-D.
% Valeur differente de k dans chaque direction .
% Acceleration et vitesse pour resolution
% approximative des equations de la cinematique
% q0: vecteur initial temps , vitesse , position
% g : vecteur initial 1, accélération , vitesse
%
f = Calculs.gravite(balle);
f = f + Calculs.visqueux(balle, [q(2) q(3) q(4)]);

vi = [q(2) q(3) q(4)];
f = f + Calculs.magnus(balle, vi, balle.VitesseAngulaire);
a = f / balle.Masse;

v = Calculs.vitesse(vi, a, q(1));
g =[q(1) a v];