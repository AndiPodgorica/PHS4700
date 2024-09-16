function [couleur] = detecterCouleur(p)
   if p(3) >= 0 && p(3) < 0.05
      couleur = 1;
   elseif p(3) >= 0.05 && p(3) < 0.1
      couleur = 2;
   elseif p(3) >= 0.1 && p(3) < 0.15
      couleur = 3;
   elseif p(3) >= 0.15 && p(3) < 0.2
      couleur = 4;
   elseif p(3) >= 0.2 && p(3) < 0.25
      couleur = 5;
   else 
      couleur = 0;
   end
end