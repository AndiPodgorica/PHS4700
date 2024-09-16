classdef Zone < handle
    
    properties
        Points
    end
    
    methods
        
        % points : tableau de vecteurs positions des coins
        %          A--B
        %          |  |
        %          C--D
        function obj = Zone(points)
            obj.Points = points;
        end
    end
end