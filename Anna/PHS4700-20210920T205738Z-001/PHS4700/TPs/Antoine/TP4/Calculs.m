classdef Calculs
    
    methods(Static)
        function out = Reflexion(v, n)
            out = v - 2 * dot(v, n) * n;
        end
        
        % donne le vecteur unitaire sortant de la refraction
        % u : vecteur unitaire entrant
        % n : vecteur unitaire normal a la surface (plan) 
        % n1 : indice de refraction 1
        % n2 : indice de refraction 2
        function out = Refraction(u, n, n1, n2)
            
            % s'assurer que les vecteurs sont unitaires
            u = u / norm(u); 
            n = n / norm(n); 
            
            max = abs(asin(n2/n1));

%             theta = 2 * atan(norm(n*norm(v) - norm(n)*v) / norm(n * norm(v) + norm(n) * v))
%             theta / pi
%             
%             thetaOut = n1 * sin(theta) / n2
            
            j = cross(u, n);
            k = cross(n, j);
            
            si = dot(k, u);
            thetai = asin(si);
%             deg = thetai / 2 /pi * 360

            if -max <= thetai && max >= thetai
                st = n1/n2 * si;

                ut = -n * sqrt(1 - st^2) + k * st;

                out = ut;
            else
                out = [0 0 0]';
            end 
        end
        
        function [bool, p] = Collision(droite, plan)
            if (dot(plan.n, droite.u) == 0)
                bool = false;
                p = [0 0 0];
            else
                bool = true;

                % t = -d - apad - bpbd - cpcd / adA + bdB +cdC
                t = (-plan.Param(4) - plan.Param(1)*droite.Point(1) - plan.Param(2)*droite.Point(2) - plan.Param(3)*droite.Point(3));
                t = t / (plan.Param(1) * droite.u(1) + plan.Param(2) * droite.u(2) + plan.Param(3) * droite.u(3));

                p = [droite.Point(1) + t*droite.u(1) ; droite.Point(2) + t*droite.u(2) ; droite.Point(3) + t*droite.u(3)];
                
                if p(1) < plan.Limits(1,1) || p(1) > plan.Limits(1,2)
                    p = [0 0 0]';
                    bool = false;
                end
                if p(2) < plan.Limits(2,1) || p(2) > plan.Limits(2,2)
                    p = [0 0 0]';
                    bool = false;
                end
                if p(3) < plan.Limits(3,1) || p(3) > plan.Limits(3,2)
                    p = [0 0 0]';
                    bool = false;
                end
                if (p - droite.Point) / droite.u < 0
                    % La collision a lieu derrière le point actuel
                    p = [0 0 0]';
                    bool = false;
                end
            end
        end
    end
    
end
