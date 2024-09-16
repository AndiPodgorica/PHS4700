function [xi, yi, zi, couleur]= Devoir4(Robs,xyp,he)

    hauteurPaille = 0.25;
    rayonCylindre = 0.04;
    hauteurCylindre = 0.2;
    pcmCylindre = [0, 0, hauteurCylindre/2];
    n_air = 1.0;
    n_eau = 1.333;
    reflexions_max = 10;
    position = 1;
    deplacement = 0.001;
    N = 200;
    K = 100; 
    xi = zeros(K*N);
    yi = zeros(K*N);
    zi = zeros(K*N);
    couleur = zeros(K*N);
 
    [minPhi, maxPhi] = calculerPhi(rayonCylindre, Robs, pcmCylindre); 
    [minTheta, maxTheta] = calculerTheta(rayonCylindre, Robs, pcmCylindre, hauteurPaille);
    u_directions = getUnitaryDirections(maxTheta, minTheta, minPhi, maxPhi);
    
    for i=1:size(u_directions, 1)
        distance = 0;
        rentrerDansEau = false;
        p = Robs;
        u_direction = transpose(u_directions(i, :));
        u_direction_saved = u_direction;
        [~, verreEauToucher, pailleToucher, p, distance] = detecterCollision(u_direction, deplacement, p, xyp, he, distance, rentrerDansEau);
        
        if verreEauToucher
            [u_direction, entreDansEau] = gererRayonRentreEau(he, rentrerDansEau, n_air, n_eau, u_direction, p);
            if entreDansEau 
                n_reflexion_verre = 0;
                pailleToucher = false;
                exterieurEau = false;
                rentrerDansEau = true;
                estExterieur = false;

                while(~pailleToucher && n_reflexion_verre < reflexions_max && ~exterieurEau && ~estExterieur )
                    [estExterieur, verreEauToucher, pailleToucher, p, distance] = detecterCollision(u_direction, deplacement, p, xyp, he, distance, rentrerDansEau);
                    if(verreEauToucher)
                        [u_direction, exterieurEau] = gererRayonRentreEau(he, rentrerDansEau, n_eau, n_air, u_direction, p);
                        if(~exterieurEau) 
                            n_reflexion_verre = n_reflexion_verre + 1;
                        end    
                    end
                end
            end

        end

        if pailleToucher
            point_toucher = Robs + distance*u_direction_saved;
            estDansVerre = verifierImageDansVerre(point_toucher);
            if(estDansVerre)
                position = position + 1;
                xi(position) = point_toucher(1);
                yi(position) = point_toucher(2);
                zi(position) = point_toucher(3);
                couleur(position) = detecterCouleur(p);
            end
        end
    end

end