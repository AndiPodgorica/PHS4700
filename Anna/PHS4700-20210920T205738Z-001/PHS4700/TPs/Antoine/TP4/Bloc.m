classdef Bloc
    %Bloc classe representant chacun des blocs
    
    properties
        Largeur
        Longueur
        Hauteur
        CDM
        n           %indice de refraction du bloc
        Plans       % Dans l'ordre : dessus, dessous, devant, derriere, gauche, droite
        
    end
    
    methods
        function obj = Bloc(lar, lon, haut, indice, cdm)
            obj.Largeur = lar;
            obj.Longueur = lon;
            obj.Hauteur = haut;
            obj.n = indice;
            obj.CDM = cdm;
            
            limits = [cdm(1)-lar/2 cdm(1)+lar/2; cdm(2)-lon/2 cdm(2)+lon/2;cdm(3)+haut/2 cdm(3)+haut/2];
            sommets = [cdm(1)-lar/2 cdm(2)-lon/2 cdm(3)+haut/2; cdm(1)+lar/2 cdm(2)-lon/2 cdm(3)+haut/2; cdm(1)+lar/2 cdm(2)+lon/2 cdm(3)+haut/2; cdm(1)-lar/2 cdm(2)+lon/2 cdm(3)+haut/2]';
            obj.Plans = Plan([0;0;1], [cdm(1);cdm(2);cdm(3)+haut/2], limits, sommets);
            
            limits = [cdm(1)-lar/2 cdm(1)+lar/2; cdm(2)-lon/2 cdm(2)+lon/2;cdm(3)-haut/2 cdm(3)-haut/2];
            sommets = [cdm(1)-lar/2 cdm(2)-lon/2 cdm(3)-haut/2; cdm(1)+lar/2 cdm(2)-lon/2 cdm(3)-haut/2; cdm(1)+lar/2 cdm(2)+lon/2 cdm(3)-haut/2; cdm(1)-lar/2 cdm(2)+lon/2 cdm(3)-haut/2]';
            obj.Plans = [obj.Plans Plan([0;0;-1], [cdm(1);cdm(2);cdm(3)-haut/2], limits, sommets)];
            
            limits = [cdm(1)-lar/2 cdm(1)-lar/2; cdm(2)-lon/2 cdm(2)+lon/2;cdm(3)-haut/2 cdm(3)+haut/2];
            sommets = [cdm(1)-lar/2 cdm(2)-lon/2 cdm(3)-haut/2; cdm(1)-lar/2 cdm(2)+lon/2 cdm(3)-haut/2; cdm(1)-lar/2 cdm(2)+lon/2 cdm(3)+haut/2; cdm(1)-lar/2 cdm(2)-lon/2 cdm(3)+haut/2]';
            obj.Plans = [obj.Plans Plan([-1;0;0], [cdm(1)-lar/2;cdm(2);cdm(3)], limits, sommets)];
            
            limits = [cdm(1)+lar/2 cdm(1)+lar/2; cdm(2)-lon/2 cdm(2)+lon/2;cdm(3)-haut/2 cdm(3)+haut/2];
            sommets = [cdm(1)+lar/2 cdm(2)-lon/2 cdm(3)-haut/2; cdm(1)+lar/2 cdm(2)+lon/2 cdm(3)-haut/2; cdm(1)+lar/2 cdm(2)+lon/2 cdm(3)+haut/2; cdm(1)+lar/2 cdm(2)-lon/2 cdm(3)+haut/2]';
            obj.Plans = [obj.Plans Plan([1;0;0], [cdm(1)+lar/2;cdm(2);cdm(3)], limits, sommets)];
            
            limits = [cdm(1)-lar/2 cdm(1)+lar/2; cdm(2)-lon/2 cdm(2)-lon/2;cdm(3)-haut/2 cdm(3)+haut/2];
            sommets = [cdm(1)-lar/2 cdm(2)-lon/2 cdm(3)-haut/2; cdm(1)+lar/2 cdm(2)-lon/2 cdm(3)-haut/2; cdm(1)+lar/2 cdm(2)-lon/2 cdm(3)+haut/2; cdm(1)-lar/2 cdm(2)-lon/2 cdm(3)+haut/2]';
            obj.Plans = [obj.Plans Plan([0;-1;0], [cdm(1);cdm(2)-lon/2;cdm(3)], limits, sommets)];
            
            limits = [cdm(1)-lar/2 cdm(1)+lar/2; cdm(2)+lon/2 cdm(2)+lon/2;cdm(3)-haut/2 cdm(3)+haut/2];
            sommets = [cdm(1)-lar/2 cdm(2)+lon/2 cdm(3)-haut/2; cdm(1)+lar/2 cdm(2)+lon/2 cdm(3)-haut/2; cdm(1)+lar/2 cdm(2)+lon/2 cdm(3)+haut/2; cdm(1)-lar/2 cdm(2)+lon/2 cdm(3)+haut/2]';
            obj.Plans = [obj.Plans Plan([0;1;0], [cdm(1);cdm(2)+lon/2;cdm(3)], limits, sommets)];
        end
    end
    
end

