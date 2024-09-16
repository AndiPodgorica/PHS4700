function systeme = Donnees()
    cylindre = CylindreTransparent();
    cylindre.Centre = Vecteur(4, 4, 11);
    cylindre.Rayon = 2;
    cylindre.Hauteur = 18;
    
    cercle1 = CreerCercle([4, 4, 2], [2, 6; 2, 6; -Inf, Inf], [0, 0, -1], cylindre.Rayon);
    cercle2 = CreerCercle([4, 4, 20], [2, 6; 2, 6; -Inf, Inf], [0, 0, 1], cylindre.Rayon);
    cylindre.Extremites = [cercle1 cercle2];

    face1 = CreerFace([3, 3, 12], [-Inf, Inf; 3, 5; 12, 17], [-1, 0, 0], 1, 'r'); %rouge
    face2 = CreerFace([4, 3, 12], [-Inf, Inf; 3, 5; 12, 17], [1, 0, 0], 2, 'r'); %cyan
    face3 = CreerFace([3, 3, 12], [3, 4; -Inf, Inf; 12, 17], [0, -1, 0], 3, 'r'); %vert
    face4 = CreerFace([3, 5, 12], [3, 4; -Inf, Inf; 12, 17], [0, 1, 0], 4, 'r'); %jaune
    face5 = CreerFace([3, 3, 12], [3, 4; 3, 5; -Inf, Inf], [0, 0, -1], 5, 'r'); %bleu
    face6 = CreerFace([3, 3, 17], [3, 4; 3, 5; -Inf, Inf], [0, 0, 1], 6, 'r'); %magenta
    
    bloc = BlocRectangulaire();
    bloc.Faces = [face1 face2 face3 face4 face5 face6];
    
    systeme = Systeme();
    systeme.CylindreTransparent = cylindre;
    systeme.BlocRectangulaire = bloc;
end

function face = CreerFace(point, bornes, normale, indice, codeCouleur)
    plan = Plan();
    plan.Point = Vecteur.CreateFromArray(point);
    plan.Normale = Vecteur.CreateFromArray(normale);
    plan.Bornes = bornes;
    
    face = Face();
    face.Indice = indice;
    face.CodeCouleur = codeCouleur;
    face.Plan = plan;
end

function cercle = CreerCercle(point, bornes, normale, rayon)
    cercle = Cercle();
    cercle.Point = Vecteur.CreateFromArray(point);
    cercle.Normale = Vecteur.CreateFromArray(normale);
    cercle.Bornes = bornes;
    cercle.Rayon = rayon;
end