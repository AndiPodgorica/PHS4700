function [rangeVertical, rangeHorizontal] = IntervallesAnglesPossibles(pointObservateur, systeme)
    [angleZMin, angleZMax] = TrouverRangeVertical(pointObservateur, systeme);
    [angleXYMin, angleXYMax]  = TrouverRangeHorizontal(pointObservateur, systeme);
    rangeVertical = [angleZMin, angleZMax];
    rangeHorizontal = [angleXYMin, angleXYMax];
end

function [angleZMin, angleZMax] = TrouverRangeVertical(pointObservateur, systeme)
    rayon = systeme.CylindreTransparent.Rayon;
    demiHauteur = systeme.CylindreTransparent.Hauteur / 2;
    centre = systeme.CylindreTransparent.Centre;
    coinVertical1 = [centre.X - rayon      centre.Y - rayon    centre.Z - demiHauteur];
    coinVertical2 = [centre.X + rayon      centre.Y + rayon    centre.Z - demiHauteur];
    coinVertical3 = [centre.X - rayon      centre.Y - rayon    centre.Z + demiHauteur];
    coinVertical4 = [centre.X + rayon      centre.Y + rayon    centre.Z + demiHauteur];
    segmentVertical1 = [coinVertical1(1) - pointObservateur.X coinVertical1(2) - pointObservateur.Y coinVertical1(3) - pointObservateur.Z];
    segmentVertical2 = [coinVertical2(1) - pointObservateur.X coinVertical2(2) - pointObservateur.Y coinVertical2(3) - pointObservateur.Z];
    segmentVertical3 = [coinVertical3(1) - pointObservateur.X coinVertical3(2) - pointObservateur.Y coinVertical3(3) - pointObservateur.Z];
    segmentVertical4 = [coinVertical4(1) - pointObservateur.X coinVertical4(2) - pointObservateur.Y coinVertical4(3) - pointObservateur.Z];
    segments = [segmentVertical1; segmentVertical2; segmentVertical3; segmentVertical4];
    %segments est composé de 3 vecteurs horizontaux
    
    angles = [0 0 0 0];
    for i = 1:4
        if segments(i, 3) < 0
            rapportTan = abs(segments(i, 3) / segments(i, 1));
            angles(i) = 90 + atand(rapportTan);
        else
            rapportTan = segments(i, 1) / segments(i, 3);
            angles(i) = atand(rapportTan);
        end
    end
    angleZMin = angles(1);
    angleZMax = angles(1);
    for i = 2:4
        if angles(i) < angleZMin
            angleZMin = angles(i);
        end
        if angles(i) > angleZMax
            angleZMax = angles(i);
        end
    end
    
    % Conversion des angles en radians
    angleZMin = deg2rad(angleZMin);
    angleZMax = deg2rad(angleZMax);
end

function [angleXYMin, angleXYMax] = TrouverRangeHorizontal(pointObservateur, systeme)
    rayon = systeme.CylindreTransparent.Rayon;
    centre = systeme.CylindreTransparent.Centre;
    segment = [centre.X - pointObservateur.X centre.Y - pointObservateur.Y centre.Z - pointObservateur.Z];
    longueurXYSegment = sqrt(segment(1)^2 + segment(2)^2);
    
    rapport = segment(2) / segment(1);
    angleSegment = atand(rapport);
    
    ecartAngleCercle = atand(rayon / longueurXYSegment);
    angleXYMin = angleSegment - ecartAngleCercle;
    angleXYMax = angleSegment + ecartAngleCercle;
    
    % Conversion des angles en radians
    angleXYMin = deg2rad(angleXYMin);
    angleXYMax = deg2rad(angleXYMax);
end