classdef Cylindre < handle
    
    properties
        Longueur
        Rayon
        CentreDeMasse
        Masse
        V
        W
        k
        A
        t
        Rot
        Points
    end
    
    methods
        function obj = Cylindre()
            obj.Longueur = 0;
            obj.Rayon = 0;
            obj.Masse = 0;
        end
        
        function Plans(obj)
           obj.Points = [];
           n = 40;
           
           for i = 0:n-1
               theta = i * (2 * pi / n);
               p1 = [ obj.CentreDeMasse(1,end) obj.CentreDeMasse(2,end) obj.CentreDeMasse(3,end) ]';
               p1(1) = p1(1) + obj.Rayon * cos(theta);
               p1(2) = p1(2) + obj.Rayon * sin(theta);
               p1(3) = p1(3) + obj.Longueur / 2;

               p2 = [ obj.CentreDeMasse(1,end) obj.CentreDeMasse(2,end) obj.CentreDeMasse(3,end) ]';
               p2(1) = p2(1) + obj.Rayon * cos(theta);
               p2(2) = p2(2) + obj.Rayon * sin(theta);
               p2(3) = p2(3) - obj.Longueur / 2;

               obj.Points = [obj.Points p1 p2];
           end
        end
      
    end
    
end

