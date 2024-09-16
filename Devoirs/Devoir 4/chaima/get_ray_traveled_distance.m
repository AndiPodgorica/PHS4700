# rays :  tableau contenant tous les points où le rayon a touché la sphère
#         ou la boite sous la forme : [ x1 x2 ... xn
#                                       y1 y2 ... yn
#                                       z1 z2 ... zn ] où n <= 4
function d = get_ray_traveled_distance(rays)
  nbr_ref = size(rays)(2); # nombre de réfractions/réflexions correspond au nombre de colonnes

  total_distance = 0;
  for i = 1:nbr_ref-1
    ri = rays(:, i);
    rf = rays(:, i+1);
    total_distance += norm(rf - ri);
  endfor

  d = total_distance;

endfunction


