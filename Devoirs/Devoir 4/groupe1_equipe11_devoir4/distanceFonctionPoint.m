function[distanceP,couleurF,pointF,n,contactSolide]=distanceFonctionPoint(distance,couleur,intersection,plan)
distanceP=distance;
couleurF=couleur;
pointF=intersection;
n=plan/norm(plan);
n=n/norm(n);
contactSolide=true;
end
