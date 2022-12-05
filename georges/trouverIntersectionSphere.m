function[contactSolide,normale,interieurSphere]= trouverIntersectionSphere(problem, line)
u=line.line_direction;
distanceProche=inf;

[intersection,distances,pointsIntersection] = LineSphereIntersect(problem, line);
if intersection
    for i = 1:length(distances)
        if distances{i} > 0 && distances{i} < distanceProche
            distanceProche = distances{i};
            point = pointsIntersection{i};
            r = point - problem.sphere.pos;
            normale = dot(r, u)/abs(dot(r, u)) * (r)/norm(r);
            normale = normale/norm(normale);
            if dot(r, u) < 0
                interieurSphere = true;
            end
            contactSolide = false;
        end
    end
end

end