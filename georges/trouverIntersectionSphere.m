function[contactSolide,n,interieurSphere]=trouverIntersectionSphere(problem,rayon)
[intersection,distances,pointsIntersection]=LineSphereIntersect(problem,rayon);
if intersection==false
    return
end
for i=1:length(distances)
    if estPlusPetitQueDistance(intersection,distances{i},inf)
        contactSolide=false;
        [distanceProche,point,r,n]=estEntre2Distances(distances{i},pointsIntersection{i},problem.sphere.pos,rayon.line_direction);
        interieurSphere=estAInterieurSphere(r,rayon.line_direction);
    end
end

end