function [x y z] = pointRayon(u,t,r)
  x = u(1)*t+r(1);
  y = u(2)*t+r(2);
  z = u(3)*t+r(3);
endfunction

