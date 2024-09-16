classdef Auto < Objet
    properties
        Masse
        Longueur
        Largeur
        Hauteur
        Position
        Vitesse
        VitesseAngulaire
        %Angle
        %Acceleration

    end
    
    methods 
        function obj = Auto()
            obj.Position = [0 0];
            obj.Vitesse = [0 0];
            obj.VitesseAngulaire = 0;
        end
    end
end