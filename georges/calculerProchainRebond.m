function [rebondit,contactSolide,distanceProche,point,normale,couleur,interieurSphere]=calculerProchainRebond(problem,line)

[couleur,distanceProche,contactSolide,interieurSphere,point,normale]=initialiserRebondValeurs(line.color,inf);

for i=1:length(problem.planes)
    [intersection, distance, intersection_point]=PlanIntersection(problem, problem.planes{i},line);
    if intersection&&distance>0&&distance<distanceProche
        [distanceProche,couleur,point,normale,contactSolide]=distanceFonctionPoint(distance,problem.planes{i}.color,intersection_point,problem.planes{i}.plane_normal);
    end
end
trouverIntersectionSphere(problem,line);
rebondit=estPlusPetitDistance(inf,distanceProche);
end
