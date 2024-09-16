# ui: la direction initiale du rayon
# i: le vecteur normal unitaire sortant du plan de réflexion (sphère)
function reflexion_totale_interne = reflexion_totale_interne(theta_i, ni, nt)
    reflexion_totale_interne = theta_i > asin(nt/ni);
endfunction
