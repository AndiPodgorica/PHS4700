function [xi, yi, zi, face] = Devoir4(nout, nin, poso)

    R = 2; % rayon cyclindre
    H = 18; % hauteur cylindre
    RC = [4, 4, 11]; % centre du cyclindre
    maxInternReflexions = 100;
    deplacement = 0.005;
    
    % phi difficile � d�terminer pr�cis�ment, donc on prend un grand intervalle
   
    [phiMinus, phiPlus] = Phi(poso);
    
    % theta facile � calculer donc on prend les vraies valeurs max/min
    [thetaMinus, thetaPlus] = Theta(poso);
     N = 400;
     M = 100;
     xi = zeros(M*N);
     yi = zeros(M*N);
     zi =  zeros(M*N);
     face = zeros(M*N);
     iRes= 1;
     
     % Tracer chaque rayon entre thetaMinus/thetaPlus et phiMin/phiPlus
     for n = 1:N
         for m = 1:M
             
             distance = 0;
             
             % Calcul des angles de ce rayon
             theta = thetaMinus + (thetaPlus - thetaMinus)/(2*N)*(2*n-1);
             phi = phiMinus + (phiPlus - phiMinus)/(2*M)*(2*m-1);
             
             % Vecteur directeur du rayon
             omega = [sin(theta)*cos(phi) sin(theta)*sin(phi) cos(theta)];
             
             % Vecteur directeur unitaire du rayon
             u = omega/norm(omega);
             uo=u;
             
             point = poso; % Point de d�part du rayon
             
             touchCylindreBorder = false;
             % Tant que le point n'a pas touch� la bordure du cylindre ou
             % d�pass� le x ou y max du cylindre, on avance
             while(touchCylindreBorder == false && (point(1) <= RC(1) + R) && (point(2) <= RC(2) + R))
                 if( ((point(1) - RC(1))^2 + (point(2) - RC(2))^2 <= R^2) && (point(3) <= RC(3) + H/2) && (point(3) >= RC(3) - H/2))
                     touchCylindreBorder = true;
                 else % Si on a pas encore atteint le cylindre
                     % Faire avancer le point dans la direction du rayon
                     point = point + deplacement * u;
                     distance = distance + deplacement;
                 end
             end
             
             % LE RAYON A ATTEINT LE CYLINDRE, OU L'A D�PASS�
             
             entersCylindre = false;
             % Pour le rayon touchant le cylindre
             if(touchCylindreBorder)
                 
                 % D�terminer si touche c�t� ou dessous (dessus impossible car observateur jamais au dessus du cylindre)
                 distanceDessous = abs(point(3) - (RC(3) - H/2));
                 distanceCote = abs(R - norm([(RC(1) - point(1)) (RC(2) - point(2))]));
                 
                 % D�terminer les vecteurs i selon o� le rayon a touch�
                 if(distanceDessous > distanceCote) % Si le rayon touche le c�t� du cylindre
                    i = [(point(1) - RC(1)), (point(2) - RC(2)), 0];
                 else % Si le rayon touche le dessous du cylindre
                    i = [0, 0, -1];
                 end
                 
                 % Tenter la r�fraction pour rayon touchant le cylindre
                 [u, entersCylindre] = IsRefracted(nout, nin, u, i);
             end
             
             if(entersCylindre) % Rayon r�fract� dans le cylindre
                 nbInternReflexions = 0;
                 touchBloc = false;
                 exitsCylindre = false;
                 % Faire des r�flexions internes jusqu'au max, jusqu'� ce
                 % qu'on touche le bloc ou jusqu'� ce qu'on sorte (r�fraction)
                 while(nbInternReflexions < maxInternReflexions && ~touchBloc && ~exitsCylindre)
                     
                     % Faire avancer le point
                     point = point + deplacement * u;
                     distance = distance + deplacement;
                    
                     % V�rifier si une surface est touch�e
                     surfaceTouchee = -1;
                     if((point(1) - RC(1))^2 + (point(2) - RC(2))^2 >= R^2) % Touche sur le c�t�
                         surfaceTouchee = 0;
                     elseif(point(3) >= RC(3) + H/2) % Touche en haut
                         surfaceTouchee = 1;
                     elseif(point(3) <= RC(3) - H/2) % Touche en bas
                         surfaceTouchee = 2;
                     end
                     
                     % Si on touche une surface mais qu'on l'a d�pass�e, reculer jusqu'� ce qu'on ne la d�passe plus
                     while(surfaceTouchee ~= -1 && ((point(1) - RC(1))^2 + (point(2) - RC(2))^2 > R^2 || point(3) > RC(3) + H/2 || point(3) < RC(3) - H/2))
                         point = point - deplacement/2 * u;
                         distance = distance - deplacement/2;
                     end
                     
                     % D�terminer le vecteur i selon la surface touch�e
                     if(surfaceTouchee == 0) % Touche sur le c�t�
                         i = [(RC(1) - point(1)) (RC(2) - point(2)) 0];
                     elseif(surfaceTouchee == 1) % Touche en haut
                         i = [0, 0, -1];
                     elseif(surfaceTouchee == 2) % Touche en bas
                         i = [0, 0, 1];
                     end

                     if(surfaceTouchee ~= -1) % Si on touche une bordure du cylindre
                         
                        % V�rifier s'il y a r�fraction
                        [uf, exitsCylindre] = IsRefracted(nin, nout, u, i);

                        if(~exitsCylindre) % R�fl�chi et on reste dans le cylindre
                            u = uf;
                            nbInternReflexions = nbInternReflexions + 1;
                        end
                     else
                        % V�rifier si on touche le bloc
                        [touchBloc, faceTouched] = pointInsideBloc(point); 
                     end

                 end
                          
                 if(touchBloc)
                     
                     % Calculer position vue par l'observateur et ajouter
                     
                     rp = poso + distance*uo;
                     
                     xi(iRes) = rp(1);
                     yi(iRes) = rp(2);
                     zi(iRes) = rp(3);
                     
                     % Ajouter la face touch�e
                     face(iRes) = faceTouched;
                     iRes = iRes+ 1;
                     
                 end
             end  
         end
     end
  
end
