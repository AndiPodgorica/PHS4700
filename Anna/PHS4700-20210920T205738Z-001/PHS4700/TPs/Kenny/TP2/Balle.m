classdef Balle < Objet

    properties
        CentreDeMasse
        Masse
        Rayon
        %Vitesse
        VitesseAngulaire
    end
    
    methods
        function obj = Balle()
            obj = obj@Objet();
            obj.CentreDeMasse = Vecteur(0, 0, 0);
            obj.Masse = 0;
            obj.Rayon = 0;
            %obj.Vitesse = Vecteur(0, 0, 0);
            %obj.VitesseAngulaire = Vecteur(0, 0, 0);
        end
    end
end