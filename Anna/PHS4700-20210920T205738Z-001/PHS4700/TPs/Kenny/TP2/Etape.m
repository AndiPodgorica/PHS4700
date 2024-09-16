classdef Etape < matlab.mixin.Copyable
    
    properties
       ¨PositionInitiale
        VitesseInitiale
        PositionFinale
        VitesseFinale
    end
    
    methods
        function obj = Etape(positionInitiale, vitesseInitiale)
            obj.PositionInitiale = positionInitiale;
            obj.VitesseInitiale = vitesseInitiale;
            obj.PositionFinale = Vecteur.CreateFromArray([0; 0; 0]);
            obj.VitesseFinale = Vecteur.CreateFromArray([0; 0; 0]);
        end
    end
end