function petitesBalles= GetPetitesBoulesCylindre (rayon, hauteur,centre,nBalle)

%Retourne des petites sphères a l'intérieur du cylindre
%Si nombre est pair alors le nombre de boulle retourné sera nombre +1
%ex: avec nombre = 4 on aura une boule au centre 2 en haut et 2 en bas.
%Retour : position x, y, z, rayon

    petitesBalles(nBalle) = Sphere;
    if(mod(nBalle,2) == 1)
        nBalle = nBalle-1;
    end

    r = rayon;
    pas = (hauteur/2-r)/(nBalle/2);
    
    %Balle du centre
    petitesBalles(nBalle/2 + 1).Rayon = r;
    petitesBalles(nBalle/2 + 1).CentreDeMasse = centre;
   for i = 1: 1: nBalle/2
        petitesBalles(nBalle/2 + 1-i).Rayon = r;
        petitesBalles(nBalle/2 + 1-i).CentreDeMasse = [centre(1),centre(2),centre(3)+i*pas];
        
        petitesBalles(i+nBalle/2+1).Rayon = r;
        petitesBalles(i+nBalle/2+1).CentreDeMasse = [centre(1),centre(2),centre(3)-i*pas];
    end
end