classdef Plan < handle
    
    
    properties
        n
        Point
        Param % Ax + By + Cz + D = 0
        Limits
        Sommets
    end
    
    methods
        function obj = Plan(n, point, limits, sommets)
            obj.n = n;
            obj.Point = point;
            obj.Param = [n' (-n(1)*point(1) - n(2)*point(2) - n(3)*point(3))];
            obj.Limits = limits;
            obj.Sommets = sommets;
        end
    end
    
end

