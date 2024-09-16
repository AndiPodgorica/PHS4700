# rm: point de contact entre le rayon et la sphère
# ri: direction du rayon incident
function [ut isReflexion] = direction_rayon_apres_contact(rm, ui, ni, nt)
  isReflexion = false;
  #ui = ri / norm(ri); # vecteur normal du rayon incident
  i = rm/norm(rm); # vecteur normal unitaire sortant du plan de réflexion (sphère)

  if cross(ui, i) == 0 # si plan d'incidence est parallèle au rayon incident
    ut = ui;
    return;
  endif

  j = cross(ui, i) / norm(cross(ui, i));
  k = cross(i, j);

  sin_transmis = (ni/nt)*dot(ui, k);
  ut = -i*sqrt(1-sin_transmis^2) + k*sin_transmis;

  angle = asin(sin_transmis);
  #réflexion totale interne
  if reflexion_totale_interne(angle, ni, nt)
    ut = reflexion(ui, i, k);
    isReflexion = true;
  endif

  ut = ut/norm(ut);
endfunction

