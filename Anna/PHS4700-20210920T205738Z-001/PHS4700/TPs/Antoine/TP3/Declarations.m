boite = Cylindre();

boite.k = 0.1;
boite.t = [0];
boite.CentreDeMasse = [3 0 10]';
boite.Masse = 0.075;
boite.Longueur = 0.15;
boite.Rayon = 0.05;
boite.V = [ 0 0 0 ]';
boite.A = boite.Rayon^2 + boite.Longueur^2;
boite.Rot = [ 0 0 0 ]';

balle = Sphere();
balle.Rayon = 0.0335;
balle.Masse = 0.058;
balle.t = [];
balle.CentreDeMasse = [ 0 0 2 ]';
balle.A = pi * boite.Rayon^2;
balle.k = 0.1;
