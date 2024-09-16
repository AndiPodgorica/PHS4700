classdef (Abstract) Objet < handle
    % Cylindre (Abstrait) Objet contenant les de base
    %   Méthodes disponibles : 
    %      - CalcMasse
    properties
        MasseVolumique
        CentreDeMasse
        Volume
        Masse
        Forme
    end
    
    methods
        function obj = Objet(forme)
            obj.MasseVolumique = 0;
            obj.CentreDeMasse = 0;
            obj.Volume = 0;
            obj.Masse = 0;
            obj.Forme = forme;
        end
        
        function m = CalcMasse(obj)
            if isnumeric(obj.MasseVolumique) && isnumeric(obj.Volume)
                if (obj.MasseVolumique == 0)
                    warning('MasseVolumique = 0')
                end
                if (obj.Volume == 0)
                    warning('Volume = 0')
                end
                obj.Masse = obj.MasseVolumique *  obj.Volume;
                m = obj.Masse;
            else
                error('MV ou Volume non defini')
            end
        end
        
    end
    
    methods (Abstract)
       m = MomentInertie(obj, centre)
    end
    
end

