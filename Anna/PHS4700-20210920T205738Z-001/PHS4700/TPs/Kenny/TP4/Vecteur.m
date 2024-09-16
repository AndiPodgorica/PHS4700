classdef Vecteur < matlab.mixin.Copyable
    properties
        X
        Y
        Z
    end
    
    methods
        function obj = Vecteur(x, y, z)
            obj.X = x;
            obj.Y = y;
            obj.Z = z;
        end
        
        function vecteur = GetVerticalArray(obj)
            vecteur = [obj.X; obj.Y; obj.Z];
        end
        
        function vecteur = GetHorizontalArray(obj)
            vecteur = [obj.X obj.Y obj.Z];
        end
    end
    
    methods (Static)
        function obj = CreateFromArray(array)
            obj = Vecteur(array(1), array(2), array(3));
        end
    end
end