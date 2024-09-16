function R = matrice_de_rotation(mu,axe)
   if axe == 'y' 
      R = [ cos(mu) 0 sin(mu); 0 1 0; -sin(mu) 0 cos(mu)];
   elseif( axe == 'x' )
      R = [1 0 0; 0 cos(mu) -sin(mu); 0 sin(mu) cos(mu)];
   else
       R = [cos(mu) -sin(mu) 0; sin(mu) cos(mu) 0; 0 0 1];
   end
end

