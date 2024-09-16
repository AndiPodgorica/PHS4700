%   u : vecteur direction
%   r : la coordonnée du dernier point
%   valeurs de retour:
%   has_collided : true si le rayon est entré en collision avec la boite
%   face : si collision, numéro de la face correspondante
%   point : si collision, coordonnées du point d'intersection
function [has_collided face point] = check_collision_with_box(u, r)
  has_collided = false;
  face = -1;
  point = [Inf Inf Inf];

  % 1. on vérifie quelles faces de la boîte ont été touchées

  % format des données:
  %     all_collisions = [  numero_face x1 y1 z1 distance
  %                         numero_face x2 y2 z2 distance
  %                         etc. ]
  %      (1 rangée = 1 collision)

  all_collisions = [];
  index = 1;

  for i = 1:6
  [point has_collided] = check_collision_with_plane(u, r, i);

    if has_collided
      all_collisions(index, 1) = i;
      all_collisions(index, 2:4) = point;
      all_collisions(index, 5) = get_distance_between_two_points(r, point);
      index += 1;
    endif

  endfor

  % si on a au moins une collision (nbr collisions = nbr de rangees dans all_collisions)
  if size(all_collisions)(1) > 0
    has_collided = true;

    % 2. on vérifie quel point est le plus proche pour déterminer la face touchée en premier (distance minimum)
    min_value = all_collisions(1, 5);
    face = all_collisions(1,1);
    point = all_collisions(1,2:4);

    for i = 1:size(all_collisions)(1)
      if all_collisions(i,5) < min_value
        min_value = all_collisions(i,5);
        face = all_collisions(i,1);
        point = all_collisions(i,2:4);
      endif
    endfor

  endif

endfunction

function p = get_distance_between_two_points(p1, p2)
  p = sqrt( (p2(1) - p1(1))^2 + (p2(2) - p1(2))^2 + (p2(3) - p1(3))^2 );
endfunction

function [point has_collided] = check_collision_with_plane(u, r, face)
  r_x = r(1); r_y = r(2); r_z = r(3);
  u_x = u(1); u_y = u(2); u_z = u(3);

  if face == 1
    t = (1/u_x) * (-Constantes.a/2 + r_x);
  elseif face == 2
    t = (1/u_x) * (Constantes.a/2 + r_x);
  elseif face == 3
    t = (1/u_y) * (-Constantes.b/2 + r_y);
  elseif face == 4
    t = (1/u_y) * (Constantes.b/2 + r_y);
  elseif face == 5
    t = (1/u_z) * (-r_z);
  elseif face == 6
    t = (1/u_z) * (Constantes.c - r_z);
  else
    t = Inf;
  endif

  [point has_collided] = get_intersect_point(t, u ,r);

endfunction

function [point has_collided] = get_intersect_point(t, u, r)
  r_x = r(1); r_y = r(2); r_z = r(3);
  u_x = u(1); u_y = u(2); u_z = u(3);

  % on trouve les coordonnées du point d'intersection selon le paramètre t
  x = u_x*t + r_x;
  y = u_y*t + r_y;
  z = u_z*t + r_z;

  intersect_point = [x y z];

  % on vérifie si le point trouvé touche une des faces de la boîte
  has_collided = in_box_interval(intersect_point);
  if has_collided
    point = intersect_point;
  else
    point = [Inf Inf Inf];
  endif

endfunction

function in_interval = in_box_interval(point)
  x = point(1); y = point(2); z = point(3);

  in_box_interval_x = x >= -Constantes.a/2 && x <= Constantes.a/2;
  in_box_interval_y = y >= -Constantes.b/2 && y <= Constantes.b/2;
  in_box_interval_z = z >= 0 && z <= Constantes.c;

  % on verifie si le point est dans les bornes de la boite
  in_interval = in_box_interval_x && in_box_interval_y && in_box_interval_z;

endfunction
