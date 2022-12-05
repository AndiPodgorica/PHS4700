function [rebondit contactSolide distanceProche point normale couleur interieurSphere] = ProchainRebond(problem, line)

plan=problem.planes;
couleur=line.color;
distanceProche=inf;
contactSolide=false;
interieurSphere=false;
point=[0; 0; 0];
normale=[0; 0; 0];

for i = 1:length(plan)
    [doesIntersect, distance, intersection_point] = PlanIntersection(problem, plan{i}, line);
    if doesIntersect && distance > 0 && distance < distanceProche
        [distanceProche,couleur,point,normale,contactSolide]=distanceFonctionPoint(distance,plan{i}.color,intersection_point,plan{i}.plane_normal);
    end
end

trouverIntersectionSphere(problem, line);
rebondit = distanceProche ~= inf;
end
