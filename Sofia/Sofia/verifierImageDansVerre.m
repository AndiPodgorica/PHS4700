function [estDansVerre]= verifierImageDansVerre(p)
    rayonCylindre = 0.04;
    hauteurPaille = 0.25;
    estDansVerre = (p(1) <= rayonCylindre && p(1) >= -rayonCylindre && p(2) <= rayonCylindre && p(2) >= -rayonCylindre && p(3) >=0 && p(3) <= hauteurPaille);
end