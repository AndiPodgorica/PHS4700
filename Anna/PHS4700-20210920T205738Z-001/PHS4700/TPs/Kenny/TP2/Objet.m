classdef (Abstract) Objet < matlab.mixin.Copyable
    properties
    end
    
    methods 
        function obj = Objet()
        end
    end
    
    methods (Abstract) 
        %v = CalculerVolume(obj)
    end
end