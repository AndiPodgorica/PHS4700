function [verreEauToucher] = detecterVerreEauToucher(p, he, rentrerDansEau)
    rayonCylindre = 0.04;
    hauteurCylindre = 0.2;  
    pcmCylindre = [0, 0, hauteurCylindre/2];
    if ~rentrerDansEau
        verreEauToucher = (rayonCylindre^2 > (p(1) - pcmCylindre(1))^2 + (p(2) - pcmCylindre(2))^2) && (p(3) >= 0 && he > p(3));
    else
        verreEauToucher = (rayonCylindre^2 < (p(1) - pcmCylindre(1))^2 + (p(2) - pcmCylindre(2))^2) || (p(3) <= 0 || he < p(3));
    end
    
end