 classdef Systeme < handle
    properties
        Table
        Filet
        Balle
        Sol
        Acceleration
    end
    
    methods
        function obj = Systeme()
            obj.Acceleration = Vecteur(0, 0, 0);
        end
        
        function hauteur = GetHauteurTable(obj)
            hauteur = obj.Table.Point.Z;
        end
        
        function hauteur = GetHauteurFilet(obj)
            hauteur = obj.Filet.Bornes(3, 2);
        end
        
        function distance = DistanceBalleAuFiletSurTable(obj, centreDeMasseBalle)
            % Distance de la balle au filet, si on met la balle directement sur la table
            copyCM = copy(centreDeMasseBalle);
            copyCM.Z = obj.GetHauteurTable();
            distance = obj.Filet.DistanceAuPoint(copyCM);
        end
    end
end