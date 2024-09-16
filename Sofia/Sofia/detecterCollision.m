function [estExterieur, verreEauToucher,pailleToucher, p, distance]= detecterCollision(u_direction, deplacement, p, xyp, he, distance, rentrerDansEau) 
    estExterieur = false; 
    verreEauToucher = false;
    pailleToucher = false;   
    rayonCylindre = 0.04;
    estCollision = false;
    hauteurCylindre = 0.2;

    while(~estCollision)
        estExterieur = detecterEstExterieur(p, rayonCylindre, hauteurCylindre);
        verreEauToucher = detecterVerreEauToucher(p, he, rentrerDansEau);
        pailleToucher = detecterPailleToucher(p, xyp); 
        if(verreEauToucher == true || pailleToucher == true || estExterieur == true)
          estCollision = true;
        end
        if (~estCollision)
            p = p + deplacement * u_direction;
            distance = distance + deplacement;
        end
    end
end