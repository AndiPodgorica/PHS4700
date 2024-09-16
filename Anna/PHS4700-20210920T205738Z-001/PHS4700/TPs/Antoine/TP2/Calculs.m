classdef Calculs
   methods(Static)
       function f = gravite(obj)
           f = [0 0 obj.Masse * -9.81];
       end
       
       function f = visqueux(obj, v)
           f = - pi * (2*obj.Rayon)^2 / 8 * 1.1644 * 1.45 * norm(v) * v;
       end
       function v = vitesse(vi, a, dt)
           v = [vi(1) + a(1) * dt vi(2) + a(2) * dt vi(3) + a(3) * dt];
       end
       function f = magnus(obj, v, w)
            C = 1.6 * 10^(-3) * norm(w);
            f = (pi * (2*obj.Rayon)^2) / 8 * 1.1644 * C * norm(v) / norm(w) * cross(w, v); 
       end
   end
end