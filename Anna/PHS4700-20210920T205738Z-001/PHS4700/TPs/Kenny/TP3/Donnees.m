function systeme = Donnees(rai, vai, rbi, vbi) 
    
    autoA = Auto();
    autoA.Masse = 1540;
    autoA.Longueur = 4.78;
    autoA.Largeur = 1.82;
    autoA.Hauteur = 1.8;
    autoA.Position = [rai(1) rai(2)];
    autoA.Vitesse = [vai(1) vai(2)];
    autoA.VitesseAngulaire = vai(3);
    
    autoB = Auto();
    autoB.Masse = 1010;
    autoB.Longueur = 4.23;
    autoB.Largeur = 1.6;
    autoB.Hauteur = 1.8;
    autoB.Position = [rbi(1) rbi(2)];
    autoB.Vitesse = [vbi(1) vbi(2)];
    autoB.VitesseAngulaire = vbi(3);
    
    systeme = Systeme();
    systeme.AutoA = autoA;
    systeme.AutoB = autoB;
    systeme.SeuilVitesseMinimale = 0.01;
    systeme.PrecisionMinimale = 0.001;

end