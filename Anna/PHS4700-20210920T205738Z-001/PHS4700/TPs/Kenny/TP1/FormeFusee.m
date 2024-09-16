classdef FormeFusee < Solide 

    properties
        Cylindre
        Cone
        Inertie
    end
    
    methods
        function fusee = FormeFusee(cylindre, cone)
            fusee = fusee@Solide();
            fusee.Cylindre = cylindre;
            cone.CentreDeMasse(3) = cone.CentreDeMasse(3) + cylindre.Hauteur; % Offset le cm du cone avec la hauteur du cylindre 
            fusee.Cone = cone;
            fusee.CentreDeMasse = [0 0 0]; % Set le centre de masse juste quand on recoit la masse
            fusee.Inertie = [0 0 0 ;0 0 0;0 0 0];
        end
        
        function CoordonneesBasMilieu(obj, x, y, z)
            obj.Cone.CentreDeMasse(1) = obj.Cone.CentreDeMasse(1) + x;
            obj.Cone.CentreDeMasse(2) = obj.Cone.CentreDeMasse(2) + y;
            obj.Cone.CentreDeMasse(3) = obj.Cone.CentreDeMasse(3) + z;

            obj.Cylindre.CentreDeMasse(1) = obj.Cylindre.CentreDeMasse(1) + x;
            obj.Cylindre.CentreDeMasse(2) = obj.Cylindre.CentreDeMasse(2) + y;
            obj.Cylindre.CentreDeMasse(3) = obj.Cylindre.CentreDeMasse(3) + z;
        end
        
        function v = CalculerVolume(obj)
            v = obj.Cylindre.CalculerVolume() + obj.Cone.CalculerVolume();
        end
        
        function RepartirMasseUniforme(obj, masse)
            obj.Masse = masse;
            obj.Cylindre.Masse = (obj.Cylindre.CalculerVolume() / obj.CalculerVolume()) * masse;
            obj.Cone.Masse = (obj.Cone.CalculerVolume() / obj.CalculerVolume()) * masse;
            obj.CentreDeMasse = CentreDeMasse.CentreDeMasseObjets([obj.Cylindre.CentreDeMasse; obj.Cone.CentreDeMasse], [obj.Cylindre.Masse; obj.Cone.Masse]);
        end
        
        function RepartirMasseParComposante(obj, masseCylindre, masseCone) 
            obj.Masse = masseCylindre + masseCone;
            obj.Cylindre.Masse = masseCylindre;
            obj.Cone.Masse = masseCone;
            obj.CentreDeMasse = CentreDeMasse.CentreDeMasseObjets([obj.Cylindre.CentreDeMasse; obj.Cone.CentreDeMasse], [obj.Cylindre.Masse; obj.Cone.Masse]);
        end
        
        function CalculerInertie(obj)
            obj.Cylindre.Inertie = MomentInertie.InertieCylindre(obj.Cylindre.Masse, obj.Cylindre.Rayon, obj.Cylindre.Hauteur);
            obj.Cone.Inertie = MomentInertie.InertieCone(obj.Cone.Masse, obj.Cone.Rayon, obj.Cone.Hauteur);         
        end
        
        function AjusterInertie(obj, cmGlobal)
            obj.Cylindre.InertieAjust = MomentInertie.InertieAjusteeCM(obj.Cylindre.Inertie, obj.Cylindre.Masse, obj.Cylindre.CentreDeMasse, cmGlobal);
            obj.Cone.InertieAjust = MomentInertie.InertieAjusteeCM(obj.Cone.Inertie, obj.Cone.Masse, obj.Cone.CentreDeMasse, cmGlobal);
            obj.Inertie = obj.Cylindre.InertieAjust + obj.Cone.InertieAjust;
        end
    end
    
end