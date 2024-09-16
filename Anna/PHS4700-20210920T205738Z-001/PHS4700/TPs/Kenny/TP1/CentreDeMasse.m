classdef CentreDeMasse
    methods(Static)

		function [centre] = CentreDeMasseCylindre(rayon, hauteur)
			% x, y, z
		
			centre = [0, 0, hauteur/2];
		end
		
		function [centre] = CentreDeMasseCone(rayon, hauteur)
		
			centre = [0, 0, hauteur/4];
		
		end
		
		
		function [centreTotal] = CentreDeMasseObjets(centreObjets, massesObjets)
			
			masseTotale = sum(massesObjets);
            
			centreTotal = [0, 0, 0];
		
			for i = 1:numel(massesObjets)
				%x = element numero 1, y = element numero 2, z = element numero 3;
				centreObjetPondere = [centreObjets(i, 1) , centreObjets(i, 2) , centreObjets(i, 3)] * massesObjets(i);
				centreTotal = centreTotal + centreObjetPondere;
			end %fin boucle for
			centreTotal = centreTotal / masseTotale;
		
		end

    end
end