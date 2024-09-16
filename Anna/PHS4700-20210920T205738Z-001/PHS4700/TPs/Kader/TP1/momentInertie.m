%Ceci est pour calculer le moment dinertie
%momentInertieLocal("cylindre", 5, 2, 2)
%momentInertieLocal("sphere", 5, 2, 0)
%matriceTranslation([1,2,3])
%momentInertieGlobal("cylindre", 5, 2, 0, [0,0,1], pi/2)
%matriceRotationOY(pi/2)
%momentInertieTotal([0,0,1], pi/2)
classdef momentInertie
    methods (Static)       
        function [MIT] = momentInertieTotal(r0, theta)
            %la composition de patineur
            rt = 0.15;
            Lt = 0.7;
            mvt = 953;
            Lj = 0.75;
            rj = 0.06;
            mvj = 1052;
            rc = 0.04;
            Lc = 0.1;
            mvc = mvt;
            rh = 0.1;
            mvh = 1056;
            rb = 0.03;
            Lb = 0.75;
            mvb = 1052;
            % le moment inetie de patineur
            MIT = [0 0 0; 0 0 0; 0 0 0];

            % tronc
            m = CalculerMasse("cylindre", rt, Lt, mvt);
            d = [0, 0, Lj+(Lt/2)];
            MIT = MIT + momentInertieGlobal("cylindreV", m, rt, Lt, r0 + d, theta);
            % jambe droite
            m = CalculerMasse("cylindre", rj, Lj, mvj);
            d = [-0.1, 0, (Lj/2)];
            MIT = MIT + momentInertieGlobal("cylindreV", m, rj, Lj, r0 + d, theta);
            % jambe gauche
            m = CalculerMasse("cylindre", rj, Lj, mvj);
            d = [0.1, 0, (Lj/2)];
            MIT = MIT + momentInertieGlobal("cylindreV", m, rj, Lj, r0 + d, theta);
            % bras droit
            m = CalculerMasse("cylindre", rb, Lb, mvb);
            d = [-(rt + (Lb/2)), 0, Lj+Lt-rb];
            MIT = MIT + momentInertieGlobal("cylindreH", m, rb, Lb, r0 + d, theta);
            % bras gauche
            m = CalculerMasse("cylindre", rb, Lb, mvb);
            d = [+(rb + rt), 0, Lj+Lt-(Lb/2)];
            MIT = MIT + momentInertieGlobal("cylindreV", m, rb, Lb, r0 + d, theta);
            % cou
            m = CalculerMasse("cylindre", rc, Lc, mvc);
            d = [0, 0, Lj+Lt+(Lc/2)];
            MIT = MIT + momentInertieGlobal("cylindreV", m, rb, Lb, r0 + d, theta);
            % tete
            m = CalculerMasse("sphere", rc, Lc, mvh);
            d = [0, 0, Lj+Lt+Lc+rh];
            MIT = MIT + momentInertieGlobal("sphere", m, rb, Lb, r0 + d, theta);
        end
    end
end

function [mi] = momentInertieGlobal(type, m, r, h, d, theta)
    MIL = momentInertieLocal(type, m, r, h);
    mi = MIL + m * matriceTranslation(d);
    if not(theta == 0)
        R = matriceRotationOY(theta);
        mi = R*mi*R'; %M2 = R*M1*R^-1 , R^-1 = transpose de la matrice d'ou le '
    end
end


function [R] = matriceRotationOY(theta)
    R = [ cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta) ];
end

function [T] = matriceTranslation(d)
    dx = d(1);
    dy = d(2);
    dz = d(3);
    T = [pow2(dy)+pow2(dz) -dx*dy -dx*dz; -dy*dx pow2(dx)+pow2(dz) -dy*dz; -dz*dx -dz*dy pow2(dx)+pow2(dy)];
end

% function [m] = masse(type, r, h, masseVolumique)
%     if(type == "cylindre")
%         V = pi * pow2(r) * h;
%     elseif(type == "sphere")
%         V = (4/3) * pi * power(r,3);
%     end
%     m = V * masseVolumique;
% end

function [mi] = momentInertieLocal(type, m, r, h)
    if(type == "cylindreV") % cylindre vertical
        %mi = m*[(pow2(r)/4)+(pow2(h)/12) 0 0; 0 (pow2(r)/4)+(pow2(h)/12) 0; 0 0 pow2(r)/2];
        z = m*r^2;
        x = (m/2)*r^2+(m/12)*h^2;
        y = x;
        mi = [x 0 0; 0 y 0; 0 0 z];
    elseif(type == "cylindreH") % cylindre horizontal
        x = m*r^2;
        y = (m/2)*r^2+(m/12)*h^2;
        z = y;
        mi = [x 0 0; 0 y 0; 0 0 z];
    elseif(type == "sphere")
        mi = ((2*m*r^2)/5)*[1 0 0; 0 1 0; 0 0 1];
    end
end
