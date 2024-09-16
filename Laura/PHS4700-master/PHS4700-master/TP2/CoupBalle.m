function coup = CoupBalle(x, y, z)
    % (x, y, z) -> coordonnées les plus récentes du centre de masse
    rayon_trou = 5.4/100;
    rayon_balle = 21.35/1000; % pour avoir en m
    
    coupe_x = 150 - 8;
    coupe_y = 150 - 8;
    if (z <= rayon_balle) % balle atteint le sol
        % Si trou atteint
        if ((x - coupe_x)^2 + (y - coupe_y)^2 <= rayon_trou^2)
            coup = 0;
        % Si la balle est dans le terrain (Ã  gauche)
        elseif (x >= 0 && x <= 30 && y >= 0 && y <= 150)
            coup = 1;
        % Si la balle est dans le terrain (en haut)
        elseif (x >= 0 && x <= 150 && y >= 130 && y <= 150) % 150-20 = 130
            coup = 1;
        % Si la balle est atterie du terrain
        
        end
    % Balle encore dans les airs, mais pas au dessus du terrain
    elseif (x < 0 || y < 0 || x > 150 || y > 150 || (x > 30 && y < 130))
        coup = 2;
    % Balle encore dans les airs, au dessus du terrain
    else
        coup = -1;
    end
end