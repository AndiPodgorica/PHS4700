classdef CylindreTransparent < handle
    properties
        Centre
        Hauteur
        Rayon
        Extremites
    end
    
    methods
        function obj = CylindreTransparent()
            obj.Extremites = [];
        end
        
        function borne = GetBorneInferieureZ(obj)
            borne = obj.Centre.Z - obj.Hauteur / 2;
        end
        
        function borne = GetBorneSuperieureZ(obj)
            borne = obj.Centre.Z + obj.Hauteur / 2;
        end
        
        function estInterieur = PointEstInterieur(obj, point)
            %Retourne true si le point est a linterieur du cylindre
            estInterieur = false;
            if (point.Z >= obj.GetBorneInferieureZ() && point.Z <= obj.GetBorneSuperieureZ())
                p1 = Vecteur(obj.Centre.X, obj.Centre.Y, 0);
                p2 = Vecteur(point.X, point.Y, 0);
                if (DistanceParcourue(p1, p2) <= obj.Rayon)
                    estInterieur = true;
                end
            end
            
        end
    end
end