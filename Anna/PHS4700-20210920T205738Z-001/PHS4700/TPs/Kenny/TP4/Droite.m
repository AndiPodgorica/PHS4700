classdef Droite < matlab.mixin.Copyable
    properties
        Point
        Pente %En realite, il s'agit d'un vecteur de direction 
    end
    
    methods
        function obj = Droite()
            obj.Point = Vecteur(0, 0, 0);
            obj.Pente = Vecteur(0, 0, 0);
        end
        
        function y = OrdonneeAOrigine(obj)
            %On oublie la composante Z
            if (obj.EstHorizontal()) 
                y = obj.Point.Y;
                return;
            elseif (obj.EstVertical())
                y = Inf;
                return;
            end
            
            steps = obj.Point.X / obj.Pente.X; %Nb de fois que l'on doit repeter le vecteur direction afin d'arriver au point X
            y = obj.Point.Y - steps * obj.Pente.Y; %On recule jusqua lorigine
        end
        
        function z = ValeurZPourX0(obj)
            %On oublie la composante Y
            if (obj.PentePlanXZ() == 0)
                z = obj.Point.Z;
                return;
            end
            
            steps = obj.Point.X / obj.PentePlanXZ(); %Nb de fois que l'on doit repeter le vecteur direction afin d'arriver au point X
            z = obj.Point.Z - steps * obj.PentePlanXZ(); %On recule jusqua lorigine
        end
        
        function z = ValeurZPourY0(obj)
            %On oublie la composante X
            if (obj.PentePlanYZ() == 0)
                z = obj.Point.Z;
                return;
            end
            
            steps = obj.Point.Y / obj.PentePlanYZ(); %Nb de fois que l'on doit repeter le vecteur direction afin d'arriver au point y
            z = obj.Point.Z - steps * obj.PentePlanYZ(); %On recule jusqua lorigine
        end
        
        function pente = PentePlanXY(obj)
            %Pente dans le plan X-Y
            pente = obj.Pente.Y / obj.Pente.X;
        end
        
        function pente = PentePlanXZ(obj)
            %Pente dans le plan X-Z
            pente = obj.Pente.Z / obj.Pente.X;
        end
        
        function pente = PentePlanYZ(obj)
            %Pente dans le plan Y-Z
            pente = obj.Pente.Z / obj.Pente.Y;
        end
        
        function estHorizontal = EstHorizontal(obj)
            estHorizontal = (obj.PentePlanXY() == 0); %Si VecteurDirecteur.Y == 0, alors c'est une droite horizontale
        end
        
        function estVertical = EstVertical(obj)
            estVertical = (obj.PentePlanXY() == Inf); %Si VecteurDirecteur.X == 0, alors c'est une droite verticale
        end
    end
end