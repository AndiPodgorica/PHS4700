function [distanceF,posFinale,faceF]=determinerFace(distanceRayon,distance,position,direction,origine,face,couleur)
posFinale=position;
faceF=face;
distanceF=distance+distanceRayon;
posFinale{end+1}=distanceF*direction+origine;
faceF{end+1}=couleur;
end