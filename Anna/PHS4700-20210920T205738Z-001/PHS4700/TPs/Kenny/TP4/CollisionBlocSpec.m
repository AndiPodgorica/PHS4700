clc; 

droite = Droite();
droite.Point = Vecteur(2, 2, 10);
droite.Pente = Vecteur.CreateFromArray([1.1, 1.1, 2]/norm([1.1, 1.1, 2]));

positionDepart = droite.Point;

systeme = Donnees();

[intersectionBlocExiste, positionIntersectionBloc, faceTouchee] = CollisionBloc(systeme, droite, positionDepart);

fprintf('\n\n');
fprintf('intersection : %d\n', intersectionBlocExiste);
fprintf('position : [%d %d %d]\n', positionIntersectionBloc(1), positionIntersectionBloc(2), positionIntersectionBloc(3));
fprintf('face : %d\n', faceTouchee);