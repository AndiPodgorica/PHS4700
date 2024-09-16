Balles = [];
for i = 1:9
    Balle = Sphere(Forme.SpherePleine);
    Balle.Rayon = 0.0365;
    Balle.Masse = 0.145;
    Balle.Position = [ 18.44 0 2.1 ];
    Balle.VitesseAngulaire = [ 0 0 50]';
    Balles = [Balles Balle];
end

Points = [ 0 -0.1524 1.8; 
            0 0.1524 1.8;
            0 -0.1524 0.8;
            0 0.1524 0.8]';
        
zonePrise = Zone(Points);

Vi1 = [-120/3.6 0 4.55/3.6]';
Vi2 = [-120/3.6 0 7.79/3.6]';
Vi3 = [-120/3.6 1.8/3.6 5.63/3.6]';