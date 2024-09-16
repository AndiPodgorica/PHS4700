function gb= GetGrosseBouleCylindre (rayon, hauteur,centre)

%Retourne une sphère englobant le cylindre
%Retour : position x, y, z, rayon

r = ((hauteur/2)^2 + rayon^2)^(1/2);
gb = Sphere();
gb.Rayon = r;
gb.CentreDeMasse = centre;

end