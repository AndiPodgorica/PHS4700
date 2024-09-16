function [pointIntersection,intersection,nouveauDirection]=intersectionDuPlan(epsilon,nbrDiminue,distance,n,valeurBas,valeurHaut,pointDepart,direction)
nouveauDirection=0;
pointIntersection=[0;0;0];
intersection=false;

if abs(dot(transpose(n),direction))>epsilon
    nouveauDirection=(distance-dot(transpose(n),pointDepart))/dot(transpose(n),direction);
    pointIntersection=nouveauDirection*direction+pointDepart;
    if pointEstAberrant(nbrDiminue,pointIntersection,valeurHaut,valeurBas)==false
        intersection=true;
    end
end

end
