function [Coll, tf, raf, vaf, rbf, vbf] = Devoir3(rai, vai, rbi, vbi, tb)
    % DEVOIR3 Executer le devoir3
    
	systeme = Donnees(rai, vai, rbi, vbi);
    
    pas = 0.01; %variation de temps à chaque itération
    precisionMinimaleInitiale = systeme.PrecisionMinimale;
    
    tf = 0;
    raf = [0, 0, 0];
    vaf = [0, 0, 0]; 
    rbf = [0, 0, 0];
    vbf = [0, 0, 0];
    Coll = 1;
    
    tempsEcoule = 0;
    
    positionsA = [systeme.AutoA.Position(1) systeme.AutoA.Position(2)];
    positionsB = [systeme.AutoB.Position(1) systeme.AutoB.Position(2)];
    
    qsA = [systeme.AutoA.Vitesse(1) systeme.AutoA.Vitesse(2) 0 systeme.AutoA.Position(1) systeme.AutoA.Position(2) 0];
    qsB = [systeme.AutoB.Vitesse(1) systeme.AutoB.Vitesse(2) 0 systeme.AutoB.Position(1) systeme.AutoB.Position(2) 0];
   
    while 1 %Loop infinie jusqu'à collision
        
        [qsA, qsB, tempsEcoule] = AppliquerRK(systeme, qsA, qsB, pas, tempsEcoule, tb);
        
        positionA = Vecteur.CreateFromArray([qsA(4) qsA(5)]);
        positionB = Vecteur.CreateFromArray([qsB(4) qsB(5)]);
        
%         if (normeVitesseA >= systeme.SeuilVitesseMinimale)
%             coinsA = CalculerCoinsVehicule(systeme.AutoA, positionA, tempsEcoule); %TODO: Enlever cette ligne
%             AfficherVehicule(coinsA, 'b'); %TODO: Enlever cette ligne
%         end
%         
%         if (normeVitesseB >= systeme.SeuilVitesseMinimale)
%             coinsB = CalculerCoinsVehicule(systeme.AutoB, positionB, max(tempsEcoule - tb, 0)); %TODO: Enlever cette ligne
%             AfficherVehicule(coinsB, 'r'); %TODO: Enlever cette ligne
%         end

        positionsA(end + 1,:) = [positionA.X positionA.Y]; %Push positions pour affichage
        positionsB(end + 1,:) = [positionB.X positionB.Y]; %Push positions pour affichage
        
        [estCollision, collisionSphereEnglobante, pointCollision, normale] = EtatCollision(systeme.AutoA, systeme.AutoB, positionA, positionB, tempsEcoule, tb);
        if (estCollision)
            tf = tempsEcoule;
            Coll = 0;
            raf = [positionA.GetHorizontalArray() deg2rad(angleAuto(systeme.AutoA, tempsEcoule))];
            rbf = [positionB.GetHorizontalArray() deg2rad(angleAuto(systeme.AutoB, max(tempsEcoule - tb, 0)))];
            [vaf, vbf] = VitessesApresCollision(systeme, positionA.GetHorizontalArray(), positionB.GetHorizontalArray(), qsA(1,1:2), qsB(1,1:2), pointCollision, normale);
            break;
        elseif (collisionSphereEnglobante && systeme.PrecisionMinimale ~= precisionMinimaleInitiale)
            systeme.PrecisionMinimale = precisionMinimaleInitiale; %Reduire pas
        elseif (systeme.PrecisionMinimale == precisionMinimaleInitiale)
            systeme.PrecisionMinimale = precisionMinimaleInitiale * 5; %Augmenter le pas puisqu'on n'est pas près d'une collision
        end
        
        normeVitesseA = norm(qsA(1,1:2));
        normeVitesseB = norm(qsB(1,1:2));
        if (normeVitesseA < systeme.SeuilVitesseMinimale && normeVitesseB < systeme.SeuilVitesseMinimale)
            %Finir simulation sans collision
            tf = tempsEcoule;
            Coll = 1;
            raf = [positionA.GetHorizontalArray() deg2rad(angleAuto(systeme.AutoA, tempsEcoule))];
            rbf = [positionB.GetHorizontalArray() deg2rad(angleAuto(systeme.AutoB, max(tempsEcoule - tb, 0)))];
            vaf = [qsA(1, 1:2) systeme.AutoA.VitesseAngulaire];
            vbf = [qsB(1, 1:2) systeme.AutoB.VitesseAngulaire];
            break;
        end
        
        if (tempsEcoule > 20) %TODO: Remove
            disp('Error: Too many iterations. Simulation ended.');
            break;
        end
        
    end
    
    AficherSimulationVisuelle(systeme, positionsA, positionsB, tf, tb);
end

function [qsA, qsB, tempsEcoule] = AppliquerRK(systeme, qsA, qsB, pas, tempsEcoule, tb)
    prevQsA = qsA;
    prevQsB = qsB;
    
    deplacementAssezPetit = false;
    intervale = pas;
    
    while (~deplacementAssezPetit)
        qsA = SEDRK4(prevQsA, tempsEcoule, intervale, 'frottement', systeme.AutoA);
      
        if(tempsEcoule >= tb) %L'auto B commence à glisser au temps tb
            qsB = SEDRK4(prevQsB, tempsEcoule, intervale, 'frottement', systeme.AutoB);
        else 
            qsB = SEDRK4(prevQsB, tempsEcoule, intervale, 'rouler', systeme.AutoB);
        end
        
        deplacementA = norm(qsA(1,4:6) - prevQsA(1,4:6));
        deplacementB = norm(qsB(1,4:6) - prevQsB(1,4:6));
        if (deplacementA < systeme.PrecisionMinimale && deplacementB < systeme.PrecisionMinimale)
            deplacementAssezPetit = true;
        else
            intervale = intervale / 2;
        end
    end
    
    tempsEcoule = tempsEcoule + intervale;
    
end

function AficherSimulationVisuelle(systeme, positionsA, positionsB, tf, tb)    
    grid on; %pour un décor quadrillé
    xlabel('X (m)');
    ylabel('Y (m)');
    
    xlim([-10 180]);
    ylim([-10 180]);
    xticks(-10:10:180)
    yticks(-10:10:180)
    
    hold on;
    AffichagePositionsInitiales(systeme);
    hold on;    
    AffichagePositionsFinales(systeme, positionsA(end,:), positionsB(end,:), tf, tb);
    hold on;
    courbeA = plot(positionsA(:,1), positionsA(:,2), 'color', 'b');
    hold on;
    courbeB = plot(positionsB(:,1), positionsB(:,2), 'color', 'r');
    hold off;
    
    legend([courbeA courbeB], 'Auto A', 'Auto B');
end

function AffichagePositionsInitiales(systeme)
    %Affiche la position de chacun des véhicules

    coinsA = CalculerCoinsVehicule(systeme.AutoA, systeme.AutoA.Position, 0);
    AfficherVehicule(coinsA, 'b');
    coinsB = CalculerCoinsVehicule(systeme.AutoB, systeme.AutoB.Position, 0);
    AfficherVehicule(coinsB, 'r');
end

function AffichagePositionsFinales(systeme, posA, posB, tempsEcoule, tb)
    %Affiche la position de chacun des véhicules

    coinsA = CalculerCoinsVehicule(systeme.AutoA, posA, tempsEcoule); %Auto A commence a tourner des le debut
    AfficherVehicule(coinsA, 'b');
    coinsB = CalculerCoinsVehicule(systeme.AutoB, posB, max(tempsEcoule - tb, 0)); %Auto B ne commence a tourner qu'au temps tb
    AfficherVehicule(coinsB, 'r');
end
