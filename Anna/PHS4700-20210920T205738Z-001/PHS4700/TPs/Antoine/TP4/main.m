skipGeneration = false;
skipSimulation = false;
skipPlot = false;

if ~skipGeneration && ~skipSimulation && ~skipPlot
    clear;  %clear la mémoire
    skipGeneration = false;
    skipSimulation = false;
    skipPlot = false;
end

clc;    %clear le texte de la console

if ~skipPlot
    clf;  %clear la mémoire
end

% --------------- INITIALISATION ---------------
disp('TP4')

npar = 6;
maxPlotDistance = 30;

tic;

%[obs, blocTrans, blocColors] = Declarations([-10 -10  15]', 1, 1.5);
%[obs, blocTrans, blocColors] = Declarations([13 10  25]', 1, 1.5);
%[obs, blocTrans, blocColors] = Declarations([-10 -10  15]', 1.33, 1.1);
[obs, blocTrans, blocColors] = Declarations([13 10  25]', 1.33, 1.1);


if ~skipGeneration
    droites = [];
    droitesList = {};
    func = {@GetVectorPlan};
    
    par = gcp('nocreate'); % If no pool, do not create new one.
    if isempty(par)
        par = parpool(npar)
    end
    
    nfaces = size(blocTrans.Plans(:));
    %Calcul des droites entre l'observateurs et les plans 
    parfor i = 1:nfaces(1)

        if dot([obs.Position;1], blocTrans.Plans(i).Param) < 0
            % le plan ne peut être vu par l'observateur
            continue 
        end

        droitesList{i} = func{1}(blocTrans.Plans(i), obs);
    end
    
    for i = 1:size(droitesList(:))
       droites = [droites droitesList{i}]; 
    end
end

timeGenerate = toc;
txt = sprintf('Took %f seconds to generate vector array', timeGenerate);
disp(txt);



if ~skipSimulation
    n = npar*2;
    totalSize = size(droites(:));
    partsSize = round(totalSize / n);
    droitesList = {};

    % Dupliquer les ressources pour eviter les acces concurents et augmenter le
    % speedup
    for i=1:n
        funList{i} = @simulationRunner;
        blocTransList{i} = blocTrans;
        blocColList{i} = blocColors;
        obsList{i} = obs;

        % Repartition naive du travail. Une queue ou une moving window serait plus efficace
        if i == n
            droitesList{i} = droites((i-1) * partsSize(1) + 1:end);
        else
            droitesList{i} = droites((i-1) * partsSize(1) + 1:i*partsSize(1));
        end
    end

    resultList = {};

    par = gcp('nocreate'); % If no pool, do not create new one.
    if isempty(par)
        par = parpool(npar)
    end


    parfor i=1:length(funList)
        d = droitesList{i};
        b1 = blocTransList{i};
        b2 = blocColList{i};
        o = obsList{i};
        resultList{i} = funList{i}(d, b1, b2, o);
        
        t = getCurrentTask(); 
        disp(['Worker ' num2str(t.ID) ' has completed i=' num2str(i)]);
    end

    %delete(gcp('nocreate'))
end

timeSimulate = toc;
txt = sprintf('Took %f seconds to run simulation', timeSimulate - timeGenerate);
disp(txt);

if ~skipPlot
    %plot
    hold on
    scatter3(obs.Position(1), obs.Position(2), obs.Position(3), 'MarkerEdgeColor','k', 'MarkerFaceColor',[0 0 0]);

    for i=1:size(resultList(:))
        res = resultList{i};

        if size(res) > 0
            for j=1:size(res(1,:)')
                v = res(:,j);

                if norm([v(1) v(2) v(3)]' - obs.Position) > maxPlotDistance
                    continue;
                end

                color = [v(4)/255 v(5)/255 v(6)/255];
                h = scatter3(v(1), v(2), v(3), 16, color);
                set(h, 'MarkerFaceColor', color);
            end
        end
    end

    hold off
end

timePlot = toc;
txt = sprintf('Took %f seconds to plot', timePlot - timeSimulate);
disp(txt);

toc; 
disp('end');

% data = [];
% for i = 1:16*16
%     data = [data 79];
% end
% 
% outputBmp(16, 16, data);
