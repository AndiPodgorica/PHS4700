function AfficherVehicule(coins, color)
    %Affiche les coins et les arêtes du véhicule

    if (~exist('color', 'var'))
        color = 'b';
    end
    
    hold on;
    plot(coins(1,1),coins(1,2), strcat(color, '.'));
    plot(coins(2,1),coins(2,2), strcat(color, '.'));
    plot(coins(3,1),coins(3,2), strcat(color, '.'));
    plot(coins(4,1),coins(4,2), strcat(color, '.'));
    
    plot([coins(1,1) coins(2,1)], [coins(1,2) coins(2,2)], color);
    plot([coins(2,1) coins(3,1)], [coins(2,2) coins(3,2)], color);
    plot([coins(3,1) coins(4,1)], [coins(3,2) coins(4,2)], color);
    plot([coins(4,1) coins(1,1)], [coins(4,2) coins(1,2)], color);
    hold off;
end