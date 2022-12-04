function [doesRebound doesHitObject closest_distance point normal color isEnteringSphere] = GetNextRebound(problem, line)

planes = problem.planes;
u = line.line_direction;

color = line.color;
closest_distance = inf;
point = [0; 0; 0];
normal = [0; 0; 0];
doesHitObject = false;
isEnteringSphere = false;

% Find intersection of line with each plane
for i = 1:length(planes)
    [doesIntersect, distance, intersection_point] = LinePlaneIntersect(problem, planes{i}, line);
    if doesIntersect && distance > 0 && distance < closest_distance
        closest_distance = distance;
        color = planes{i}.color;
        point = intersection_point;
        normal = planes{i}.plane_normal/norm(planes{i}.plane_normal);
        normal = normal/norm(normal);
        doesHitObject = true;
    end
end

% find intersection with sphere
[doesIntersect distances intersection_points] = LineSphereIntersect(problem, line);
if doesIntersect
    for i = 1:length(distances)
        if distances{i} > 0 && distances{i} < closest_distance
            closest_distance = distances{i};
            point = intersection_points{i};
            r = point - problem.sphere.pos;
            normal = dot(r, u)/abs(dot(r, u)) * (r)/norm(r);
            normal = normal/norm(normal);
            if dot(r, u) < 0
                isEnteringSphere = true;
            end
            doesHitObject = false;
        end
    end
end

doesRebound = closest_distance ~= inf;

end
