# ui: la direction initiale du rayon
# i: le vecteur normal unitaire sortant du plan de réflexion (sphère)
function [ut teta] = refraction(ui, i, k, ni, nt)
  sin_teta = (ni/nt)*dot(ui, k);
  ut = -i*sqrt(1-sin_angle^2) + k*sin_angle;
  angle = asin(sin_angle);
endfunction
