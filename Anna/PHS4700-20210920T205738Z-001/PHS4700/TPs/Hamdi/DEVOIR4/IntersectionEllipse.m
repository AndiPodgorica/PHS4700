% col: il y a eu une collision: true, false
% point_inter: le point d'intersection
function [col, point_inter] = IntersectionEllipse (point, v_dir)
  cm   = [4;4;11]; % centre de l'ellipse
  abc = [3;3;9];
  
  w = v_dir./abc;
  u = (point - cm)./abc;
  
  a = w'*w;
  b = w'*u+u'*w;
  c = u'*u-1;
  
  solt = roots([a,b,c]);
  sol = solt(imag(solt)==0);
  if isempty(sol)
    col = false;
    point_inter = point; % pas important dans ce cas
  else
    col = true;
    if length(sol) == 2
      p = @(param) v_dir .* param + point;
      d1 = norm(p(sol(1)) - point);
      d2 = norm(p(sol(2)) - point);
      if d1 < d2
        proche = p(sol(1));
        loin = p(sol(2));
      else
        proche = p(sol(2));
        loin = p(sol(1));
      end
      
      %is point inside ellipse?
      if sum(((point-cm)./[3;3;9]).^2) <= 1
        %inside
        %return the furthest point
        point_inter = loin;
      else
        %return the closest point
        point_inter = proche;
      end
    end
  end
end
