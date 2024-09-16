function [intersectionBlocExiste, positionIntersectionBloc, faceTouchee] = CollisionBloc(systeme, droite, positionDepart)
    %TODO: Iterer sur chacune des faces pour voir si la droite intersecte
    
    intersectionBlocExiste = false;
    pointIntersectionLePlusProche = [Inf, Inf, Inf];
    positionIntersectionBloc = [0, 0, 0];
    faceTouchee = 0;
    
    for i = 1:6
        %fprintf('\nBoucle #%d\n', i);
        
        intersectionFaceExiste = false;
        
        % Equation de la distance a un point : (ax + by + cz + d) / sqrt(a^2 + b^2 + c^2)
        planBloc = systeme.BlocRectangulaire.Faces(i).Plan;
        A = planBloc.Normale.X;
        B = planBloc.Normale.Y;
        C = planBloc.Normale.Z;
        D = -planBloc.Normale.X * planBloc.Point.X - planBloc.Normale.Y * planBloc.Point.Y - planBloc.Normale.Z * planBloc.Point.Z;
        
        %Valeur des parametre de l'equation parametrique d'une droite
        
        %point passant par la droite
        a0 = droite.Point.X;
        b0 = droite.Point.Y;
        c0 = droite.Point.Z;
        
        %direction de la droite
        %disp(droite.Pente);
        a = droite.Pente.X;
        b = droite.Pente.Y;
        c = droite.Pente.Z;
        
        %Formule de resolution du parametre d'intersection t
        %https://stackoverflow.com/questions/23975555/how-to-do-ray-plane-intersection
        
        %on verifie que la droite n'est pas parallele au plan
        determinant = A * a + B * b + C * c;
        if (determinant ~= 0)
            t = -(D + A * a0 + B * b0 + C * c0) / determinant;
        else
            continue;
        end
        
        %on resout les equations parametriques de la droite
        x = a * t + a0;
        y = b * t + b0;
        z = c * t + c0;
        
        %on verifie que le point est situe dans la face du bloc
        
        %fprintf('Position quad [%d %d %d]\n', x, y, z);

        if (planBloc.PointTouche(Vecteur(x, y, z)))
            intersectionFaceExiste = true;
            intersectionBlocExiste = true;
        end
        
        %on sauvegarde le point de collision le plus proche du point
        %d'origine
        if (intersectionFaceExiste)
            %fprintf('intersection face existe\n');
            distanceAncientPoint = sqrt( (pointIntersectionLePlusProche(1) - positionDepart.X)^2 + (pointIntersectionLePlusProche(2) - positionDepart.Y)^2 + (pointIntersectionLePlusProche(3) - positionDepart.Z)^2);
            distanceNouveauPoint = sqrt( (x - positionDepart.X)^2 + (y - positionDepart.Y)^2 + (z - positionDepart.Z)^2);
            
            %fprintf('nouveau %d ancien %d\n', distanceNouveauPoint, distanceAncientPoint);
            
            if (distanceNouveauPoint < distanceAncientPoint)
                %fprintf('on selectionne car %d < %d\n', distanceNouveauPoint, distanceAncientPoint);
                pointIntersectionLePlusProche = [x, y, z];
                %on retourne la face pour se rappeller de la couleur
                faceTouchee = systeme.BlocRectangulaire.Faces(i).Indice;
            end           
        end
    end
    
    %on retourne le pointDintersectionLePlusProche
    if(intersectionBlocExiste)
       positionIntersectionBloc = pointIntersectionLePlusProche; 
    end
    
end