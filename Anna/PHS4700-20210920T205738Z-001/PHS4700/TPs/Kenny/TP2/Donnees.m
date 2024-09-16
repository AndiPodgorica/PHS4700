function systeme = Donnees(cmBalle, vitesseAngulaire) 
    table = Table();
    table.Normale = Vecteur(0, 0, 1);
    table.Point = Vecteur(0, 0, 0.76);
    table.Bornes = [0, 2.74; 0, 1.525; 0.76, 0.76]; % Épaisseur négligeable en Z
    
    filet = Filet();
    filet.Normale = Vecteur(1, 0, 0);
    filet.Point = Vecteur(2.74 / 2, 0, 0.76);
    filet.Bornes = [2.74 / 2, 2.74 / 2; -0.1525, 1.83 - 0.1525; 0.76, 0.76 + 0.1525]; % Épaisseur négligeable en X
    
    balle = Balle();
    balle.CentreDeMasse = Vecteur.CreateFromArray(cmBalle);
    balle.Rayon = 1.99 / 100;
    balle.Masse = 2.74 / 1000;
    balle.VitesseAngulaire = vitesseAngulaire;
    
    sol = Plan();
    sol.Normale = Vecteur(0, 0, 1);
    sol.Point = Vecteur(0, 0, 0);
    sol.Bornes = [-Inf, Inf; -Inf, Inf; 0, 0]; % Épaisseur négligeable en Z

    systeme = Systeme();
    systeme.Table = table;
    systeme.Filet = filet;
    systeme.Balle = balle;
    systeme.Sol = sol;


end