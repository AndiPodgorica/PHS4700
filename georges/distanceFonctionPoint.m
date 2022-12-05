function[distanceP,couleurF,pointF,n,contactSolide] = distanceFonctionPoint(distance,couleur,intersection,nPlan)
distanceP=distance;
couleurF=couleur;
pointF=intersection;
n = nPlan/norm(nPlan);
n = n/norm(n);
contactSolide=true;
end
