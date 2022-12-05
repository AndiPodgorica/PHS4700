function [rebondit,contactSolide,dp,point,normale,couleur,interieurSphere]=calculerProchainRebond(plans,sphereRayon,spherePos,rayon,epsilon,nbrDiminue)

[couleur,dp,contactSolide,interieurSphere,point,normale]=initialiserRebondValeurs(rayon.color,inf);

for i=1:length(plans)
    [intersection, distance, intersectionP]=PlanIntersection(epsilon,nbrDiminue,plans{i},rayon);
    if estIntersection(distance,intersection,dp)
        [dp,couleur,point,normale,contactSolide]=distanceFonctionPoint(distance,plans{i}.color,intersectionP,plans{i}.plane_normal);
    end
end
trouverIntersectionSphere(sphereRayon,spherePos,rayon.line_direction,rayon.line_point);
rebondit=estPlusPetitDistance(inf,dp);
end
