classdef Plan < matlab.mixin.Copyable
    % Reference http://mathworld.wolfram.com/Plane.html
    % Equation d'un plan : ax + by + cz + d = 0, ou (a, b, c) est la normale et (x, y, z) un point du plan
    
    properties
        Normale
        Point
        Bornes
    end
    
    methods
        function obj = Plan()
            obj.Normale = Vecteur(0, 0, 0);
            obj.Point = Vecteur(0, 0, 0);
            obj.Bornes = [-Inf, Inf; -Inf, Inf; -Inf, Inf];
        end
        
        function distance = DistanceAuPoint(obj, point)
            % Equation de la distance a un point : (ax + by + cz + d) / sqrt(a^2 + b^2 + c^2)
            d = -obj.Normale.X * obj.Point.X - obj.Normale.Y * obj.Point.Y - obj.Normale.Z * obj.Point.Z;
            distance = (obj.Normale.X * point.X + obj.Normale.Y * point.Y + obj.Normale.Z * point.Z + d) / sqrt(obj.Normale.X^2 + obj.Normale.Y^2 + obj.Normale.Z^2);
        end
        
        function respecteBornes = RespecteBornes(obj, point)
            % Indique si le point donné est contenu à l'intérieur des bornes du plan
            
            respecteBornes = true;
            if (obj.Bornes(1, 1) > point.X || obj.Bornes(1, 2) < point.X)
                respecteBornes = false;
            end
            
            if (obj.Bornes(2, 1) > point.Y || obj.Bornes(2, 2) < point.Y)
                respecteBornes = false;
            end
            
            if (obj.Bornes(3, 1) > point.Z || obj.Bornes(3, 2) < point.Z)
                respecteBornes = false;
            end
        end
        
        function collision = PointEstDerriere(obj, point)
            collision = (obj.RespecteBornes(point) && (obj.DistanceAuPoint(point) < 0));
        end
        
        function collision = PointTouche(obj, point)
            collision = (obj.RespecteBornes(point) && (obj.DistanceAuPoint(point) == 0));
        end
    end
end