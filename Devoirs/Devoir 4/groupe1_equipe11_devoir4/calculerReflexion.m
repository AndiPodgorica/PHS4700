function rayonReflechi=calculerReflexion(direction,couleur,nbrRebond,ptDepart,ptDepartDirection,distance,n,point)
k=cross(n/norm(n),cross(n/norm(n),direction/norm(direction))/norm(cross(n/norm(n),direction/norm(direction))));
si=dot(k,direction/norm(direction));
ur=(n/norm(n))*sqrt(1-si^2)+k*si;
rayonReflechi=calculerRayonReflechi(ur,point,couleur,nbrRebond,ptDepart,ptDepartDirection,distance);
end
