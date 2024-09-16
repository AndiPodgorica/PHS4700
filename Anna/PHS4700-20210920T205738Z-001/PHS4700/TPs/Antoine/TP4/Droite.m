classdef Droite < handle
    
    
    properties
        u
        Point
    end
    
    methods
        function obj = Droite(u, point)
            obj.u = u;
            obj.Point = point;
        end
    end
    
end

