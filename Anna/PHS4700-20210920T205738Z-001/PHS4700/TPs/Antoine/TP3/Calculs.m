classdef Calculs
   methods(Static)
       function f = gravite(obj)
           f = [0 0 obj.Masse * -9.81];
       end
       
       function f = visqueuxBalle(obj, v)
           f = - obj.k * obj.A * v;
       end
       
       function v = vitesse(vi, a, dt)
           v = [vi(1) + a(1) * dt vi(2) + a(2) * dt vi(3) + a(3) * dt];
       end
       
       function v = vecteurEntrePoints(p1, p2) 
          v = p2 - p1;
       end
       
       % Retourne vrai si les deux triangles s'intersectent
       function p = planSeparation(triangle1, triangle2)
           pk1 = triangle1(1:3,1) - triangle1(1:3,2);
           pk2 = triangle1(1:3,1) - triangle1(1:3,3);
           
           nk = cross(pk1, pk2) / norm(cross(pk1, pk2));
           
           col1 = dot(nk,triangle2(1:3,1) - triangle1(1:3,1));
           col2 = dot(nk, triangle2(1:3,2) - triangle1(1:3,1));
           col3 = dot(nk, triangle2(1:3,3) - triangle1(1:3,1));
           
           p = col1 > 0 || col2 > 0 || col3 > 0;
       end
       
       function dispCDM(obj1, obj2)
           disp('obj1');
           disp(obj1.CentreDeMasse(:,end)');
           disp('obj2');
           disp(obj2.CentreDeMasse(:,end)');
           disp('delta');
           disp(obj1.CentreDeMasse(:,end)' - obj2.CentreDeMasse(:,end)');
       end
   end
end