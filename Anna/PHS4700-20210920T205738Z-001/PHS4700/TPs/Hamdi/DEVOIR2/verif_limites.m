function [coup] = verif_limites(r)
    x = r(1);
    y = r(2);
    z = r(3);
    h = 3.5;                % hauteur de la calotte
    r_vert = 15;                 % le rayon du vert
    Rcoupe = 0.054;     % le rayon de la coupe
    centre_coupe = [92;53];
    
    equation_limite_incline = @(x) 0.9*x-54;
    
    R = 0.5*(r_vert^2-h^2)/h;   % Rayon de la sphere
    equation_cercle = @(x,y) (x-centre_coupe(1))^2+(y-centre_coupe(2))^2;
    centre_sphere = [centre_coupe;-(R-h)];
    equation_sphere = @(r) (r-centre_sphere)'*(r-centre_sphere);
    
    if x < 0 || y < 0 || x > 110 || y > 70
        % verification des limites du terrain: coup = 3
        coup = 3;
    elseif x > 60 && y < equation_limite_incline(x)
        coup = 3;
    elseif equation_cercle(x,y) >= r_vert^2 && z <= 0
        % verification coup 2
        coup = 2;
    elseif equation_cercle(x,y) <= Rcoupe^2 && z <= 3.5
        % verification coup = 0
        coup = 0;
    elseif equation_sphere(r) <= R^2
        % verification vert coup = 1
        coup = 1;
    else
        coup = -1;
    end
end

