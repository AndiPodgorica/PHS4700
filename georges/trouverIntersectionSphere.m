function[contactSolide,n,interieurSphere]=trouverIntersectionSphere(rayonSphere,positionSphere,direction,point)
[intersection,distances,pointsIntersection]=LineSphereIntersect(rayonSphere,point,direction);
if intersection==false
    return
end
for i=1:length(distances)
    if estPlusPetitQueDistance(intersection,distances{i},inf)
        [r,n]=estEntre2Distances(pointsIntersection{i},positionSphere,direction);
        interieurSphere=estAInterieurSphere(r,direction);
        contactSolide=false;
    end
end

end