function [xi yi zi face] = Devoir4(Robs, nint, next)
  # vecteur unitaire direction du rayon passant par le cercle de la sphère et par Robs
  u = -Robs/norm(Robs);
  xi = [];
  yi = [];
  zi = [];
  face = [];

  # calcul de delta theta
  d_t_max = sqrt(Robs(1)^2+Robs(2)^2+Robs(3)^2); # distance observateur - centre sphère
  delta_angle = thetaMax(d_t_max);

  p = 1;
  theta_mid = acos(u(3)/p);
  if u(2) >=0
    azimuth_mid = acos(u(1)/sqrt(u(1)^2+u(2)^2));
  else
    azimuth_mid = 2*3.1416 - acos(u(1)/sqrt(u(1)^2+u(2)^2));
  endif

  theta = theta_mid - delta_angle;
  azimuth = azimuth_mid - delta_angle;

  var_angle = delta_angle * 2/800;
  % theta et azimuth varient -delta_angle < theta_mid < delta_angle
  for i = 0:800
    for j = 0:800
      cx = [];
      cy = [];
      cz = [];

      #nouveau rayon
      r_f = [p*sin(theta)*cos(azimuth) p*sin(theta)*sin(azimuth) p*cos(theta)];
      ui = r_f/norm(r_f);
      u0 = ui;

      #verifier collision rayon et sphere ( à partir de Robs)
      [x y z isContact] = bertha(ui,Robs);

      #nouvelle direction
      if isContact
        [ur isReflexion] = direction_rayon_apres_contact([x y z],ui, nint, next);
        # points de contact pour ce rayon
        cx(end+1) = x;
        cy(end+1) = y;
        cz(end+1) = z;
        if isReflexion
          break;
        endif
      else
        break;
      endif

      #vérifier pour 3 autres points contacts
      for k = 1:3
        ui = ur;
        # verifier collision boite
        [has_collided curr_face point] = check_collision_with_box(ui,[cx(end) cy(end) cz(end)]);
        if has_collided
          #image virtuelle avec xi yi zi
          cx(end+1) = point(1);
          cy(end+1) = point(2);
          cz(end+1) = point(3);
          d_total = get_ray_traveled_distance([cx; cy; cz]);
          rp = get_virtual_image_point(Robs, d_total, u0);
          xi(end+1) = rp(1);
          yi(end+1) = rp(2);
          zi(end+1) = rp(3);
          face(end+1) = curr_face;
          break;
        else # sinon collision sphère
          [x y z isContact] = bertha(ui,[cx(end) cy(end) cz(end)]);
          if isContact
            cx(end+1) = x;
            cy(end+1) = y;
            cz(end+1) = z;
            [ur isReflexion] = direction_rayon_apres_contact([x y z],ur, next, nint);
            if isReflexion
              break;
            endif
          endif
        endif
      endfor
      #variations azimuth
      azimuth += var_angle;
    endfor
     #variations theta
    theta += var_angle;
  endfor
endfunction

