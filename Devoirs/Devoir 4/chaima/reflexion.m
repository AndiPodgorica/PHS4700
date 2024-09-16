# ui: la direction initiale du rayon
# i: le vecteur normal unitaire sortant du plan de réflexion (sphère)
function ur = reflexion(ui, i, k)
  ur = ui - 2*i*dot(ui,i);
  teta = asin(dot(ui, k)); #teta: l’angle d’incidence et l’angle de réflexion
endfunction
