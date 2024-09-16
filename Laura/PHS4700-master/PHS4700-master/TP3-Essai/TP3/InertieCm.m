function inertieCm = InertieCm(m, L, l, h)
  Ixx =  (m/12)* (h^2 + l^2);
  Iyy = (m/12)* (h^2 + L^2);
  Izz = (m/12) * (L^2+ l^2);
  
  inertieCm = [Ixx 0 0; 0 Iyy 0; 0 0 Izz ];
end