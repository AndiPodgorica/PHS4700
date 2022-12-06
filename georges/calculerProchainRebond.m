function [rebondit,contactSolide,dp,posFinale,n,couleur,interieurSphere]=calculerProchainRebond(plans,sphereRayon,spherePos,rayon,epsilon,nbrDiminue)
[couleur,dp,contactSolide,interieurSphere,posFinale,n]=initialiserRebondValeurs(rayon.c);

for i=1:length(plans)
    [intersectionP,intersection,distance]=intersectionDuPlan(epsilon,nbrDiminue,plans{i}.d,plans{i}.n,plans{i}.l,plans{i}.h,rayon.lignePos,rayon.ligneU);
    if estIntersection(distance,intersection,dp)
        [dp,couleur,posFinale,n,contactSolide]=distanceFonctionPoint(distance,plans{i}.c,intersectionP,plans{i}.n);
    end
end
trouverIntersectionSphere(sphereRayon,spherePos,rayon.ligneU,rayon.lignePos);
rebondit=estPlusPetitDistance(dp);
end
