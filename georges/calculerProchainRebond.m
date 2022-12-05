function [rebondit,contactSolide,dp,posFinale,n,couleur,interieurSphere]=calculerProchainRebond(plans,sphereRayon,spherePos,rayon,epsilon,nbrDiminue)
[couleur,dp,contactSolide,interieurSphere,posFinale,n]=initialiserRebondValeurs(rayon.color,inf);

for i=1:length(plans)
    [intersectionP,intersection,distance]=intersectionDuPlan(epsilon,nbrDiminue,plans{i}.plane_distance,plans{i}.plane_normal,plans{i}.plane_domaine_lower_bound,plans{i}.plane_domaine_upper_bound,rayon.line_point,rayon.line_direction);
    if estIntersection(distance,intersection,dp)
        [dp,couleur,posFinale,n,contactSolide]=distanceFonctionPoint(distance,plans{i}.color,intersectionP,plans{i}.plane_normal);
    end
end
trouverIntersectionSphere(sphereRayon,spherePos,rayon.line_direction,rayon.line_point);
rebondit=estPlusPetitDistance(inf,dp);
end
