function [xi, yi, zi, face] = Devoir4(nout, nin, dep)
  M = 150;
  N = 50;
  Vobs = dep';
  phi_min = atan((2-Vobs(3))/(1-Vobs(2)));
  phi_max = atan((20-Vobs(3))/(1-Vobs(2)));
  theta_min = atan((4-Vobs(1))/(1-Vobs(2)));
  theta_max = atan((1-Vobs(1))/(4-Vobs(2)));
  cm   = [4;4;11];
  
  xi = zeros(N*M,1);
  yi = zeros(N*M,1);
  zi = zeros(N*M,1);
  face = zeros(N*M,1);
  i = 0;
  
  for m= 1:M
    for n = 1:N
      theta = theta_min + ( theta_max - theta_min ) * (2*n-1)/(2*N);
      phi = phi_min + ( phi_max - phi_min ) * (2*m-1)/(2*M);
      omega_nm =   [sin(theta)*cos(phi); sin(theta)*sin(phi); cos(theta)];
      
      [col, point_inter] = IntersectionEllipse(Vobs, omega_nm);
      
      if col % intersection avec l'ellipse
        %plot3(point_inter(1),point_inter(2),point_inter(3),'r+');
        
        d = norm(point_inter - Vobs);
        [valid, color, d]  = follow(point_inter, omega_nm, nout, nin, d, 0, false);
        if valid
          %dessiner l'image
          r_p = Vobs + d * omega_nm;
          i = i + 1;
          xi(i) = r_p(1);
          yi(i) = r_p(2);
          zi(i) = r_p(3);
          face(i) = color;
        end
      end
    end
   end
   
   xi = xi(1:i,:);
   yi = yi(1:i,:);
   zi = zi(1:i,:);
   face = face(1:i,:);
   
end
