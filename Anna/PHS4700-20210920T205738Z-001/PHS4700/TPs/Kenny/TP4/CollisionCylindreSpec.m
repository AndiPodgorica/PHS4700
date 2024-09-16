clc; 

droite = Droite();
droite.Point = Vecteur(3, 4, 0);
droite.Pente = Vecteur.CreateFromArray([1, 0, 1]);

positionDepart = droite.Point;

systeme = Donnees();

[intersectionCylindreExiste, positionIntersectionCylindre, normaleIntersectionCylindre] = CollisionCylindre(droite, positionDepart, systeme.CylindreTransparent);

fprintf('\n\n');
fprintf('intersection : %d\n', intersectionCylindreExiste);
fprintf('position : [%d %d %d]\n', positionIntersectionCylindre.X, positionIntersectionCylindre.Y, positionIntersectionCylindre.Z);
fprintf('normale : [%d %d %d]\n', normaleIntersectionCylindre(1), normaleIntersectionCylindre(2), normaleIntersectionCylindre(3));