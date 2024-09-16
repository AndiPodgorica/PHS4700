classdef  Sortie < handle
    % Cylindre (Abstrait) Objet contenant les de base
    %   Méthodes disponibles : 
    %      - CalcMasse
    properties
        x
        y
        z
        t
        vx
        vy
        vz
    end
    
    methods
        function obj = Sortie()
            obj.x = [];
            obj.y = [];
            obj.z = [];
            obj.t = [];
            obj.vx = [];
            obj.vy = [];
            obj.vz = [];
        end
        
        function m = Add(obj, x, y, z, t, vx, vy, vz)
            obj.x = [obj.x [x]];
            obj.y = [obj.y [y]];
            obj.z = [obj.z [z]];
            obj.t = [obj.t [t]];
            obj.vx = [obj.vx [vx]];
            obj.vy = [obj.vy [vy]];
            obj.vz = [obj.vz [vz]];
            m = obj;
        end
        
    end
end