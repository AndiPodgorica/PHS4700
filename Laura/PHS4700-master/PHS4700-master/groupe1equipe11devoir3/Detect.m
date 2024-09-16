function [isCollision, collisionVector] = Detect(rotatedPos1, rotatedPos2, carNumber, cm_a, cm_b)
    source = rotatedPos1;
    incoming = rotatedPos2;
    r_a_min = sqrt(4.78^2 + 1.82^2)/2; % Composante en z pas importante
    r_b_min = sqrt(4.23^2 + 1.6^2)/2;
    
    % Verifier s'il y a une collision avec la methode de plan de division

    % 4 coins de l'auto 
    %        (a)
    % 1 o---------o 2
    %   |         | (b)
    %   |         |
    % 4 o---------o 3
    % coin 1 de l'auto position x
    
    isCollision =0;
    
    % contient coin de l'auto source (x,y) et surface de collision de
    % l'auto incoming (normale)
    collisionVector = [0 0; 0 0];
    
    coinsEnCollision = [0 0];
    surfaceEnCollision = [0 0];
    
    if(abs(cm_a - cm_b) > r_a_min + r_b_min) % Certain pas de collision
        isCollision = 0;
    else % Collision à vérifier avec la méthode des plans de division
    
        normale = [Normale(incoming(1,:), incoming(2,:)); Normale(incoming(2,:), incoming(3,:)); Normale(incoming(3,:), incoming(4,:)); Normale(incoming(4,:), incoming(1,:))];

        % evaluer d = n*(r-q)
        coinsSourceSurfaceIncoming = SurfaceCoins(source, incoming, normale);

        % Plan de division si d>0 donc pas de collision
        % au moins u column ou >0 de la matrix (all column of coinsSourceSurfaceIncoming >
        % 0)
        if(any(all(coinsSourceSurfaceIncoming > 0, 1) > 0))
            isCollision = 0;
        else
            for row = 1:size(coinsSourceSurfaceIncoming, 1)
                if(all(coinsSourceSurfaceIncoming(row,:)< 0))
                    isCollision = carNumber; % auto a = 1
                    coinsEnCollision = source(row,:); % coins en collision
                    for col = 1:size(coinsSourceSurfaceIncoming, 2)
                        if(nnz(coinsSourceSurfaceIncoming(:,col) > 0) == 3) % number of non zero matrix element --> 3 autre coins au dessus de l'auto
                            surfaceEnCollision = -normale(col,:);
                        end
                    end
                end
            end
        end

        collisionVector = [coinsEnCollision; surfaceEnCollision];
    end
    
end

function surfaceCoins = SurfaceCoins(coins1, coins2, normale2)
    % 1 est auto A et 2 auto B si on checher coins A surface B sinon 
    % 1 est auto B et 2 est auto A si on cherche coinB surface A
    
    surfaceCoins = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
    for row=1:4
        for col=1:4
            %r-q
            difference = coins1(row, :) - coins2(col,:);
            % n dot (r-q)
            produit = dot(normale2(col, :), difference);
            surfaceCoins(row, col) = produit;
        end
    end
end