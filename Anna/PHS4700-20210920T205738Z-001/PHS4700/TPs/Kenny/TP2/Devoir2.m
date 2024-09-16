function [coup, tf, rbf, vbf] = Devoir2(option, rbi, vbi, wbi)
% DEVOIR2 Executer le devoir2
%   INPUT
%   option 1: gravite, 
%          2: gravite + frottement, 
%          3: gravite + frottement + Magnus
%   rbi vecteur positions initiales du cm de la balle (m)
%   vbi vecteur vitesse initiale du cm de la balle (m/s)
%   wbi vecteur vitesse angulaire de la balle autour de son cm (rad/s)
%   OUTPUT
%   coup 0 si coup reussi (atterit sur la table du côté opposé au filet), 
%        1 si atterit cote joueur qui frappe en premier,
%        2 si frappe filet en premier,
%        3 si touche sol en premier (hors des bornes)
%   tf temps de la fin de la simulation (s)
%   rbf vecteur positions finales du cm de la balle (m)
%   vbf vecteur vitesse finale du cm de la balle (m/s)

    fonctionG = 'g1';
    if (option == 2)
        fonctionG = 'g2';
    end
    if (option == 3)
        fonctionG = 'g3';
    end

	systeme = Donnees(rbi, wbi);
    positionInitialeBalle = Vecteur.CreateFromArray(rbi);
    vitesseInitialeBalle = Vecteur.CreateFromArray(vbi);
    vitesseAngulaireInitialeBalle = Vecteur.CreateFromArray(wbi);
    
    pas = 0.00001; %variation de temps à chaque itération
    
    coup = 3;
    tf = 0;
    rbf = [0; 0; 0];
    vbf = [0; 0; 0];
    
    positionsX = [];
    positionsY = [];
    positionsZ = [];
    
    tempsEcoule = 0;
    
    qs = [vbi(1) vbi(2) vbi(3) rbi(1) rbi(2) rbi(3)];
    while 1 %Loop infinie jusqu'à collision
        
        qs = SEDRK4(qs, 0, tempsEcoule + pas, fonctionG, systeme.Balle);
        
        positionBalle = Vecteur.CreateFromArray([qs(4) qs(5) qs(6)]);
        positionsX(end + 1) = positionBalle.X; %Push positions pour affichage
        positionsY(end + 1) = positionBalle.Y;
        positionsZ(end + 1) = positionBalle.Z;
        
        c = etatCollision(systeme, positionInitialeBalle, positionBalle);
        if (c ~= -1)
            coup = c;
            tf = tempsEcoule + pas;
            rbf = positionBalle.GetHorizontalArray();
            vbf = qs(1, 1:3);
            break;
        end
        
        if (tempsEcoule > 10) %TODO: Remove
            disp('Error: Too many iterations. Simulation ended.');
            break;
        end

        tempsEcoule = tempsEcoule + pas;
    end
    
    numeroOption = num2str(option);
    nom = strcat('option ', numeroOption);
    dessinerSimulationVisuelle(positionsX, positionsY, positionsZ, nom);
end

function dessinerSimulationVisuelle(positionsX, positionsY, positionsZ, nom)    
    %table verte
    vertFonce = [0.4392 0.7961 0.4941];
    longueurTable = 2.74; largeurTable = 1.525; hauteurTable = 0.76;
    
    patch([0, longueurTable, longueurTable, 0], [0, 0, largeurTable, largeurTable], [hauteurTable, hauteurTable, hauteurTable, hauteurTable], vertFonce);
    
    %filet jaune
    jauneFonce = [0.8 0.8 0];
    hauteurFilet = 0.1525 + hauteurTable;
    xFilet = longueurTable/2;
    yDebordementFiletNegatif = -0.1525;
    yDebordementFiletPositif = 1.6775;
    patch([xFilet, xFilet, xFilet, xFilet], [yDebordementFiletNegatif, yDebordementFiletNegatif, yDebordementFiletPositif, yDebordementFiletPositif], [hauteurTable, hauteurFilet, hauteurFilet, hauteurTable], jauneFonce); 
    
    grid on; %pour un décor quadrillé
    xlabel('X');
    xlim([-0.5 5.5]);
    ylabel('Y');
    ylim([-1 3]);
    zlabel('Z');
    zlim([0 1.6]);
    view([-1, -1, hauteurTable * 1.5]);
    
    hold on;
    plot = plot3(positionsX, positionsY, positionsZ);
    legend(plot, {nom});
    hold off;
end

function coup = etatCollision(systeme, positionDepart, positionBalle)

    % Étape 1
    respecteToleranceFilet = systeme.Filet.RespecteBornesAvecTolerance(positionBalle, systeme.Balle.Rayon);
    if (respecteToleranceFilet) %Touche le filet!
        coup = 2;
        return;
    end
    
    % Étape 2
    respecteToleranceTable = systeme.Table.RespecteBornesAvecTolerance(positionBalle, systeme.Balle.Rayon);
    if (respecteToleranceTable) %Touche la table!
        %Déterminer si c'est du côté du joueur ou de l'autre
        distInitiale = systeme.Filet.DistanceAuPoint(positionDepart);
        distFinale = systeme.Filet.DistanceAuPoint(positionBalle);
        
        if ((distInitiale < 0 && distFinale < 0) || (distInitiale > 0 && distFinale > 0)) %point départ et point de fin du même côté du filet
            coup = 1; %frappe côté du joueur qui a frappé en premier
        else
            coup = 0;
        end
        return;
    end
    
    % Étape 3
    respecteToleranceSol = systeme.Sol.RespecteBornesAvecTolerance(positionBalle, systeme.Balle.Rayon);
    if (respecteToleranceSol) %Touche le sol!
        coup = 3;
        return;
    end
    
    % Étape 4
    coup = -1; %Aucune collision

end

