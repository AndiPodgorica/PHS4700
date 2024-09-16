function [pointInsideParallepiped, faceTouched] = pointInsideBloc(point)
    % Surfaces du parallépipède
    xMin = 3;
    xMax = 4;
    yMin = 3;
    yMax = 5;
    zMin = 12;
    zMax = 17;
    
    % Si dans la zone du parallépipède
    if(point(1) <= xMax && point(1) >= xMin && point(2) >= yMin && point(2) <= yMax  && point(3) >= zMin && point(3) <= zMax)
        pointInsideParallepiped = true;
        % Déterminer face touchée
        distancePointSurface1 = abs(point(1) - xMin);
        distancePointSurface2 = abs(point(1) - xMax);
        distancePointSurface3 = abs(point(2) - yMin);
        distancePointSurface4 = abs(point(2) - yMax);
        distancePointSurface5 = abs(point(3) - zMin);
        distancePointSurface6 = abs(point(3) - zMax);
        
        distances = [distancePointSurface1, distancePointSurface2, distancePointSurface3, distancePointSurface4, distancePointSurface5, distancePointSurface6];
        minDistance = min(distances);
        % Déterminer de quelle surface le point est le plus près
        if(minDistance == distancePointSurface1)
            faceTouched = 1;
        elseif(minDistance == distancePointSurface2)
            faceTouched = 2;
        elseif(minDistance == distancePointSurface3)
            faceTouched = 3;
        elseif(minDistance == distancePointSurface4)
            faceTouched = 4;
        elseif(minDistance == distancePointSurface5)
            faceTouched = 5;
        elseif(minDistance == distancePointSurface6)
            faceTouched = 6;
        end
    else
        pointInsideParallepiped = false;
        faceTouched = 0;
    end
end