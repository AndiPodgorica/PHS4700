classdef Sphere < Objet & handle
    % Sphere Objet contenant les propriétés d'un sphere
    %   Méthodes disponibles : 
    %      - CalcVolume
    %      - CalcMasse (Hérité d'Objet)
    
    properties
        Rayon
    end
    
    methods
        % forme : type Forme, permet de déterminer si plein ou creux.
        function obj = Sphere(forme)
            if (forme ~= Forme.SpherePleine && forme ~= Forme.SphereCreuse)
                error('Shpere pas de type Forme.Sphere*')
            end
            obj = obj@Objet(forme);
            obj.Rayon = 0;
        end
        
        function v = CalcVolume(obj)
            if isnumeric(obj.Rayon)
                if (obj.Rayon == 0)
                    warning('Rayon = 0')
                end
               obj.Volume = 4/3 * pi * obj.Rayon^3; 
               v = obj.Volume;
            end
        end
        
        function m = CalcMasse(obj)
            m = CalcMasse@Objet(obj);
        end
        
        function m = MomentInertie(obj, centre)
           m = MomentInertieForme(obj.Masse, obj.Rayon, 0, 0, 0, obj.Forme); 
           m = AjustementInertieCentreDeMasse(m, obj.Masse, obj.CentreDeMasse, centre);
        end
       
    end
    
end

