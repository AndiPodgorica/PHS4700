function [ results ] = simulationRunner( droites, blocTrans, blocColors, obs )
%SIMULATIONRUNNER Execute simulation on given vectors
    results = [];
    
    for i = 1:size(droites(:))   
        rayon = droites(i);

    %         if dot(rayon.u, blocTrans.Plans(i).n) > 0
    %             break;
    %         end

        [collision, couleur, dist] = simulateRayon(rayon, blocTrans, blocColors, obs);

        if collision == true
            results = horzcat(results, [rayon.Point + rayon.u * dist ; couleur.R ; couleur.G ; couleur.B]);
       end
    end

end

