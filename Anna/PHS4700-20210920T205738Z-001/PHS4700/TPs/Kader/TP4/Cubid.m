classdef Cubid 
    
    properties
      p1
      p2
      p3
      p4
      size
    end
    
    methods
        function obj = Cubid(r0)
            obj.size = [1;2;5];
            obj.p1 = [3;1;12] + r0;
            obj.p2 = obj.p1 + [0;obj.size(2);0];
            obj.p3 = obj.p1 + [0;obj.size(2);obj.size(3)];
            obj.p4 = obj.p1 + [0;0;obj.size(3)];
        end
        
        function [A, B, C, D, couleur] = Surface(obj, i)
            switch i
                case 1
                    % Indique si le point donné est contenu à l'intérieur des bornes du plan
                    A = obj.p1;
                    B = obj.p2;
                    C = obj.p3;
                    D = obj.p4;
                    couleur = "rouge";
                case 2
                    
                    A = obj.p1 + [obj.size(1);0;0];
                    B = obj.p2 + [obj.size(1);0;0];
                    C = obj.p3 + [obj.size(1);0;0];
                    D = obj.p4 + [obj.size(1);0;0];
                    couleur = "cyan";
                case 3
                    A = obj.p2 + [obj.size(1);0;0];
                    B = obj.p2;
                    C = obj.p3;
                    D = obj.p3 + [obj.size(1);0;0];
                    couleur = "vert";
                
                case 4
                    A = obj.p1;
                    B = obj.p1 + [obj.size(1);0;0];
                    C = obj.p4 + [obj.size(1);0;0];
                    D = obj.p4;
                    couleur = "jaune";
                    
                    
                case 5
                    A = obj.p1;
                    B = obj.p2;
                    C = obj.p2 + [obj.size(1);0;0];
                    D = obj.p1 + [obj.size(1);0;0];
                    couleur = "bleu";
                case 6
                    A = obj.p4 + [obj.size(1);0;0];
                    B = obj.p3 + [obj.size(1);0;0];
                    C = obj.p3;
                    D = obj.p4;
                    couleur = "magenta";
                otherwise
                    A = [NaN;NaN;NaN];
                    B = [NaN;NaN;NaN];
                    C = [NaN;NaN;NaN];
                    D = [NaN;NaN;NaN];
                    couleur = "";
            end    
        end
    end
end