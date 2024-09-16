classdef Cercle < Plan    
    properties
        Rayon
    end
    
    methods
        function obj = Cercle()
            obj = obj@Plan();
        end
        
        function respecteBornes = RespecteBornes(obj, point)
            % Indique si le point donné est contenu à l'intérieur des bornes du plan
            
            respecteBornes = false;
            
            if (obj.Point.Z == point.Z)
                p1 = Vecteur(obj.Point.X, obj.Point.Y, 0);
                p2 = Vecteur(point.X, point.Y, 0);
                if (DistanceParcourue(p1, p2) < obj.Rayon)
                    respecteBornes = true;
                end
            end
        end
    end
end