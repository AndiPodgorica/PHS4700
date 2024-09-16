function u = get_initial_ray_direction(r0, r1)
  numerator = r1 - r0;
  denominator = norm(numerator)
  u = numerator/denominator;
endfunction
