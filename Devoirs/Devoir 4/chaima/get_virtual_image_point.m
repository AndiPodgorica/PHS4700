# r0: position observateur
# d: distance totale parcourue par le rayon
# u: direction initiale du rayon
function rp = get_virtual_image_point(r0, d, u)
  rp = r0 + (d * u);
endfunction
