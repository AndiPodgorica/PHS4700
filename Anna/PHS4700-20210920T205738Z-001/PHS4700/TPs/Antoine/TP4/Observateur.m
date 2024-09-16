classdef Observateur
    %Observateur Classe qui permet de representer l observateur
    
    properties
    Position,
    n %indice de refraction dans lequel l observateur se trouve
    end
    
    methods
        function obj = Observateur(pos, indice)
            obj.Position = pos;
            obj.n = indice;
        end
    end
    
end

