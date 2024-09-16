function [estExterieur] = detecterEstExterieur(p, rayonCylindre, hauteurCylindre)
    estExterieur = p(1) > hauteurCylindre/2 || -rayonCylindre >= p(1) || -rayonCylindre >= p(2) || p(2) > hauteurCylindre/2 || p(3) > 0.3 || p(3) < -0.1;  
end