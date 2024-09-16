function [x y z isContact] = bertha(u, Robs)
  x = -1;
  y = -1;
  z = -1;
  a = dot(u,u);
  b = 2*dot(u,Robs);
  c = dot(Robs,Robs) - Constantes.R*Constantes.R;
  if b^2-4*a*c < 0
    isContact = false;
    return;
  endif
  isContact = true;
  t1 = (-b-sqrt(b^2-4*a*c))/(2*a);
  t2 = (-b+sqrt(b^2-4*a*c))/(2*a);
  [x1 y1 z1] = pointRayon(u,t1,Robs);
  [x2 y2 z2] = pointRayon(u,t2,Robs);
  p1 = get_distance_between_two_points(Robs, [x1 y1 z1]);
  p2 = get_distance_between_two_points(Robs, [x2 y2 z2]);
  if p1 < p2
    x = x1;
    y = y1;
    z = z1;
  else
    x = x2;
    y = y2;
    z = z2;
  endif
endfunction

function p = get_distance_between_two_points(p1, p2)
  p = sqrt( (p2(1) - p1(1))^2 + (p2(2) - p1(2))^2 + (p2(3) - p1(3))^2 );
endfunction
