classdef Color 
    %Color 
    enumeration 
        Cyan([0,255,255]),
        Rouge([255,0,0]),
        Vert([0,255,0]),
        Jaune([255,255,0]),
        Bleu([0,0,255]),
        Magenta([255,0,255]),
        Blanc([255,255,255])
    end
    properties
        R,
        G,
        B
    end
    
    methods
        function obj = Color(composition)
            obj.R = composition(1);
            obj.G = composition(2);
            obj.B = composition(3);
        end
    end
    
end

