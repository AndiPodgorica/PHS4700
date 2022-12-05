function [intersection,t,pointIntersection] = PlanIntersection(problem, plan, ligne)
d = plan.plane_distance;
n = plan.plane_normal;
p = ligne.line_point;
u = ligne.line_direction;
pointIntersection = [0; 0; 0];
intersection = false;
t = nan;

limiteInferieurePlan = plan.plane_domaine_lower_bound;
limitePlanSuperieur = plan.plane_domaine_upper_bound;

if abs(dot(n.', u))<problem.hyperParam.epsilon
    return;
end

t=(d-dot(n.',p))/dot(n.', u);

pointIntersection = p+(t*u);

for i = 1:problem.hyperParam.ndim
    if  pointIntersection(i) > limitePlanSuperieur(i) || pointIntersection(i) < limiteInferieurePlan(i)
        return;
    end
end

intersection = true;

end
