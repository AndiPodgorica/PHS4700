function [doesIntersect t intersection_point] = LinePlaneIntersect(problem, plane, line)
n = plane.plane_normal;
d = plane.plane_distance;
plane_domaine_lower_bound = plane.plane_domaine_lower_bound;
plane_domaine_upper_bound = plane.plane_domaine_upper_bound;
p = line.line_point;
u = line.line_direction;

intersection_point = [0; 0; 0];
t = nan;
doesIntersect = false;

% Check if the line is parallel to the plane
if abs(dot(n.', u)) < problem.hyperParam.epsilon
    return;
end

t = (d - dot(n.', p))/dot(n.', u);

% Check if the intersection point is in the plane domaine
intersection_point = p + t*u;

for i = 1:problem.hyperParam.ndim
    if intersection_point(i) < plane_domaine_lower_bound(i) || intersection_point(i) > plane_domaine_upper_bound(i)
        return;
    end
end

doesIntersect = true;

end
