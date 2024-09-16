classdef Cylindre < Solide
   
    properties 
        Rayon
        Hauteur
        Inertie
        InertieAjust
    end
    
    methods
        function cyl = Cylindre()
            cyl = cyl@Solide();
            cyl.Rayon = 0;
            cyl.Hauteur = 0;
            cyl.Inertie = [0 0 0 ;0 0 0;0 0 0];
            cyl.InertieAjust = [0 0 0 ;0 0 0;0 0 0];
        end
        
        function v = CalculerVolume(obj) 
            v = pi * obj.Rayon ^ 2 * obj.Hauteur;
        end
    end
    
end