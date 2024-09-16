classdef Cone < Solide
   
    properties 
        Rayon
        Hauteur
        Inertie
        InertieAjust
    end
    
    methods
        function cone = Cone()
            cone = cone@Solide();
            cone.Rayon = 0;
            cone.Hauteur = 0;
            cone.Inertie = [0 0 0 ;0 0 0;0 0 0];
            cone.InertieAjust = [0 0 0 ;0 0 0;0 0 0];
        end
        
        function v = CalculerVolume(obj) 
            v = 1/3 * pi * obj.Rayon ^ 2 * obj.Hauteur;
        end
    end
    
end