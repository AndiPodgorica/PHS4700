function rays = GenerateInitialRays(problem)

if (problem.hyperParam.debugMode)
    problem.hyperParam.n_rayon_minimum = problem.hyperParam.n_rayon_minimum_debug;
end

rays = {};

k = problem.param.R_obs;
i  = [k(2); -k(1); 0];
if ( norm(i) == 0)
    i = [0; k(3); -k(2)];
end
j  = cross(k, i);

k = k/norm(k);
i = i/norm(i);
j = j/norm(j);

n_rays = ceil( 4/pi * problem.hyperParam.n_rayon_minimum + 0.01*problem.hyperParam.n_rayon_minimum);
n_rays = mod(n_rays, 2) + n_rays;
n_rays_per_axe = ceil(sqrt(n_rays));
ray_step = 2*problem.sphere.R/n_rays_per_axe;

for i_ray = -n_rays_per_axe/2:n_rays_per_axe/2
    for j_ray = -n_rays_per_axe/2:n_rays_per_axe/2
        t = i_ray*ray_step;
        u = j_ray*ray_step;
        potentiel_ray_sphere_hit = t*i + u*j;
        if dot(potentiel_ray_sphere_hit, potentiel_ray_sphere_hit) > problem.sphere.R^2
            continue;
        end
        ray = {};
        ray.origin = problem.param.R_obs;
        ray.origin_direction = potentiel_ray_sphere_hit - problem.param.R_obs;
        ray.origin_direction = ray.origin_direction/norm(ray.origin_direction);
        ray.color = nan;
        ray.distance = 0;
        ray.nRebound = 0;
        ray.line_direction = potentiel_ray_sphere_hit - problem.param.R_obs;
        ray.line_direction = ray.line_direction/norm(ray.line_direction);
        ray.line_point = problem.param.R_obs;
        rays{end+1} = ray;
    end
end

if (problem.hyperParam.debugMode)
    printf("Nombre de rayons générés %d \n",length(rays));
end

end
