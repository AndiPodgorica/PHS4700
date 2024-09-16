function [collision, stop, n] = verif_limites(rballe, rbloc, vbloc)
    Rmin = 6*10^-2*sqrt(3)/2;
    Abloc = 6*10^(-2);
    Rballe = 2*10^-2;
    
    n = [0;0;0];
    
    if rballe(3) <= 0 || rbloc(3) <= 0
        stop = true;
        collision = false;    
    elseif norm(rballe - rbloc) <= Rmin + Rballe
        %%%%%
        rAng = atan(vbloc(2)/vbloc(1));
        R = [cos(-rAng) -sin(-rAng) 0; sin(-rAng) cos(-rAng) 0; 0 0 1];
        %droite
        q1 = (rbloc' + [1 1 1]*Abloc*R/2);
        q2 = (rbloc' + [1 -1 1]*Abloc*R/2);
        q3 = (rbloc' + [1 -1 -1]*Abloc*R/2);
        p1 = q1 - q2;
        p2 = q1 - q3;
        plan1 = [p1', p2', q1'];
        
        %dessus
        q1 = (rbloc' + [1 -1 1]*Abloc*R/2);
        q2 = (rbloc' + [1 1 1]*Abloc*R/2);
        q3 = (rbloc' + [-1 +1 +1]*Abloc*R/2);
        p1 = q1 - q2;
        p2 = q1 - q3;
        plan2 = [p1', p2', q1'];
        
        %avant
        q1 = (rbloc' + [-1 +1 +1]*Abloc*R/2);
        q2 = (rbloc' + [1 1 1]*Abloc*R/2);
        q3 = (rbloc' + [1 1 -1]*Abloc*R/2);
        p1 = q1 - q2;
        p2 = q1 - q3;
        plan3 = [p1', p2', q1'];
        
        %
        q1 = (rbloc' + [1 -1 1]*Abloc*R/2);
        q2 = (rbloc' + [-1 -1 1]*Abloc*R/2);
        q3 = (rbloc' + [-1 -1 -1]*Abloc*R/2);
        p1 = q1 - q2;
        p2 = q1 - q3;
        plan4 = [p1', p2', q1'];
        
        %
        q1 = (rbloc' + [-1 -1 -1]*Abloc*R/2);
        q2 = (rbloc' + [1 -1 -1]*Abloc*R/2);
        q3 = (rbloc' + [1 1 -1]*Abloc*R/2);
        p1 = q1 - q2;
        p2 = q1 - q3;
        plan5 = [p1', p2', q1'];
        
        %
        q1 = (rbloc' + [-1 1 1]*Abloc*R/2);
        q2 = (rbloc' + [-1 1 -1]*Abloc*R/2);
        q3 = (rbloc' + [-1 -1 -1]*Abloc*R/2);
        p1 = q1 - q2;
        p2 = q1 - q3;
        plan6 = [p1', p2', q1'];
        
        plans = {plan1, plan2, plan3, plan4, plan5, plan6};
        for k = 1:6
            n = cross(plans{k}(:,1), plans{k}(:,2));
            n = n/norm(n);
            d = dot(n, rballe - plans{k}(:,3));
            if d <= Rballe
                collision = true;
                stop = false;
                return;
            end
        end
    else
        stop = false;
        collision = false;
    end
    
end