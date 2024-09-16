function [point, natureDIntersection] = IntersectionDroitePlan(r0, rt, plan)
    %r0: point d attache de la droite; rt: vecteur directeur de la droite;
    %plan: les A B C D du plan
    A = plan(1);
    B = plan(2);
    C = plan(3);
    D = plan(4);
    
    a = rt(1);
    b = rt(2);
    c = rt(3);
    
    x0 = r0(1);
    y0 = r0(2);
    z0 = r0(3);
    
    n = [A;B;C]
    if dot (n,rt) == 0 
        if (A*x0 + B*y0 + C*z0 + D == 0)
            %infinité de solution
            natureDIntersection = "droite"
        else            
            %aucune solution
            natureDIntersection = "aucune"
        end
        point = [NaN;NaN;NaN]
    else
        t = -(A*x0+ B*y0+C*z0 + D)/(A*a + B*b+C*c);
        %verification
        x = x0 + a * t;
        y = y0 + b * t;
        z = z0 + c * t;

        %une seule solution
        natureDIntersection = "point"
        point = [x;y;z]
    end
end