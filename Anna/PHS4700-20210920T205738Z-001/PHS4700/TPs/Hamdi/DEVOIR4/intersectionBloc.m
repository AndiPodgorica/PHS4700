% col: il y a eu une collision: true, false
% point_inter: le point d'intersection
function [col, point_inter, couleur] = IntersectionBloc(point, v)
    couleur = 0;
    cm   = [3.5;4;14.5]; % centre du bloc
    dim = [1; 2; 5]; % dimensions du bloc
    
    %plan rouge
    eqn1 = [v(1), point(1)-3];
    
    %plan cyan
    eqn2 = [v(1), point(1)-4];

    %plan vert
    eqn3 = [v(2), point(2)-3];

    %plan cyan
    eqn4 = [v(2), point(2)-5];

    %plan cyan
    eqn5 = [v(3), point(3)-12];

    %plan cyan
    eqn6 = [v(3), point(3)-17];

    plans = [eqn1; eqn2; eqn3; eqn4; eqn5; eqn6];
    normal = {[-1;0;0],[1;0;0],[0;-1;0],[0;1;0],[0;0;-1],[0;0;1]};

    %%%% on suppose qu'il n'y a aucune intersection
    d = 9999999; % distance entre point et le point d'intersection
    col = false;
    point_inter = point;
    %%%
    
    for i = 1:6
        solt = roots(plans(i,:));
        if isempty(solt)
            % pas d'intersection
            continue;
        end
    
        sol = solt(imag(solt)==0);
        
        if (~isempty(sol)) && dot(normal{i}, v) <= 0  
            
            p = @(param) v .* param + point;
            psol =  p(sol(1));
            x = psol(1);
            y = psol(2);
            z = psol(3);

            a = ((i == 1 || i == 2) & pointInRectangle([y, z], [cm(2), cm(3)], [dim(2), dim(3)]));
            b = ((i == 3 || i == 4) & pointInRectangle([x, z], [cm(1), cm(3)], [dim(1), dim(3)]));
            c = ((i == 5 || i == 6) & pointInRectangle([x, y], [cm(1), cm(2)], [dim(1), dim(2)]));
            if(a | b | c)
                if norm(point-[x;y;z]) < d
                  point_inter = [x; y; z];
                  d = norm(point-point_inter);
                  col = true;
                  couleur = i;
                end
            end

        end
    end
  end
  