classdef Cylindre < Objet & handle
    % Cylindre Objet contenant les propriétés d'un cylindre
    %   Méthodes disponibles : 
    %      - CalcVolume
    %      - CalcMasse (Hérité d'Objet)
    
    properties
        Longueur
        Rayon
    end
    
    methods
        % forme : type Forme, permet de déterminer si plein ou creux.
        function obj = Cylindre(forme)
            if (forme ~= Forme.CylindrePlein && forme ~= Forme.CylindreCreux)
                error('Cylindre pas de type Forme.Cylindre*')
            end
            obj = obj@Objet(forme);
            obj.Longueur = 0;
            obj.Rayon = 0;
        end
        
        function v = CalcVolume(obj)
            if isnumeric(obj.Rayon) && isnumeric(obj.Longueur)
                if (obj.Rayon == 0)
                    warning('Rayon = 0')
                end
                if (obj.Longueur == 0)
                    warning('Longueur = 0')
                end
               obj.Volume = pi * obj.Rayon^2 * obj.Longueur; 
               v = obj.Volume;
            end
        end
        
        function m = CalcMasse(obj)
            m = CalcMasse@Objet(obj);
        end
                
        function m = MomentInertie(obj, centre)
           m = MomentInertieForme(obj.Masse, obj.Rayon, obj.Longueur, 0, 0, obj.Forme); 
           m = AjustementInertieCentreDeMasse(m, obj.Masse, obj.CentreDeMasse, centre);
        end
        
    end
    
end

