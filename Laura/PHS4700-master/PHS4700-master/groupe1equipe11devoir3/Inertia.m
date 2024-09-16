function [inertia] = Inertia(m, w, h, d)
  Ih = (m/12) * (w^2 + d^2);
  Iw = (m/12) * (d^2 + h^2);
  Id = (m/12) * (w^2 + h^2);
  inertia = [Ih Iw Id];
end