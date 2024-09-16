function [valid, color, d]  = follow (point_incidence, dir_incidence, ni, nt,d, nb_reflexion, isInsideEllipse)
  valid = false;
  color = 0;
  if nb_reflexion >= 100
    return;
  end
  
  cm   = [4;4;11];
  N = (point_incidence - cm) ./ ([3;3;9]).^2; % Normale sortante
  N = N/norm(N);
  dir_incidence = dir_incidence/norm(dir_incidence);
  
  if isInsideEllipse
    N = -N;
  end
  
  j = cross(dir_incidence, N) / norm(cross(dir_incidence, N));
  k = cross(N, j)/norm(cross(N, j));
  theta_i = asin(dot(dir_incidence, k));  % angle d'incidence
  %theta_i = atan2(norm(cross(N,dir_incidence)),dot(N,dir_incidence)); % angle d'incidence
  theta_max = abs(asin(nt/ni));
  
  if theta_i < theta_max
    %refraction
    theta_t = asin(ni*sin(theta_i)/nt);
        
    u_r = - N * cos(theta_t) + k * sin(theta_t); % la nouvelle direction
    if isInsideEllipse
      return;
    else
      isInsideEllipse = true;
      temp = ni;
      ni = nt;
      nt = temp;
    end
  else
    %reflexion
    if ~isInsideEllipse
      return;
    end
    nb_reflexion = nb_reflexion + 1;
    u_r = dir_incidence - 2 * N * dot(dir_incidence, N); % la nouvelle direction
  end
  
  [col, point_inter, color] = IntersectionBloc(point_incidence, u_r);
  
  if col
    valid = true;
    d = d + norm(point_inter - point_incidence);
    return;
  else
    % find the new intersection with the ellipse
    [col, point_inter] = IntersectionEllipse(point_incidence, u_r);
    if col
      %plot3(point_inter(1),point_inter(2),point_inter(3),'g+');
      d = d + norm(point_inter - point_incidence);
      [valid, color, d] = follow(point_inter, u_r, ni, nt, d, nb_reflexion, isInsideEllipse);
      return;
    end
  end
end
