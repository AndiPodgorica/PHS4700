classdef Vecteur < matlab.mixin.Copyable
    properties
        X
        Y
    end
    
    methods
        function obj = Vecteur(x, y)
            obj.X = x;
            obj.Y = y;
        end
        
        function vecteur = GetVerticalArray(obj)
            vecteur = [obj.X; obj.Y];
        end
        
        function vecteur = GetHorizontalArray(obj)
            vecteur = [obj.X obj.Y];
        end
    end
    
    methods (Static)
        function obj = CreateFromArray(array)
            obj = Vecteur(array(1), array(2));
        end
    end
end