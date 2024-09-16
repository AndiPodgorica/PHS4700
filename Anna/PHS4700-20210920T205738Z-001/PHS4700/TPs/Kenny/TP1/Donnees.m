% On definit toutes les positions lorsque la navette est immobile sur la
% rampe de lancement

% Navette
mNavette = 109000;

basNavette = Cylindre();
basNavette.Rayon = 3.5;
basNavette.Hauteur = 27.93;
basNavette.CentreDeMasse = CentreDeMasse.CentreDeMasseCylindre(basNavette.Rayon, basNavette.Hauteur);


hautNavette = Cone();
hautNavette.Rayon = 3.5;
hautNavette.Hauteur = 9.31;
hautNavette.CentreDeMasse = CentreDeMasse.CentreDeMasseCone(hautNavette.Rayon, hautNavette.Hauteur);

navette = FormeFusee(basNavette, hautNavette);
navette.CoordonneesBasMilieu(0, 0, 0);
navette.RepartirMasseUniforme(mNavette);

%Calcul de l'inertie totale de la navette
navette.CalculerInertie();


% Reservoir
basReservoir = Cylindre();
basReservoir.Rayon = 4.2;
basReservoir.Hauteur = 39.1;
basReservoir.CentreDeMasse = CentreDeMasse.CentreDeMasseCylindre(basReservoir.Rayon, basReservoir.Hauteur);

hautReservoir = Cone();
hautReservoir.Rayon = 4.2;
hautReservoir.Hauteur = 7.8;
hautReservoir.CentreDeMasse = CentreDeMasse.CentreDeMasseCone(hautReservoir.Rayon, hautReservoir.Hauteur);

masseHydrogeneBasReservoir = 108000;
volumeOxygeneBasReservoir = pi * (4.2 ^ 2) * (39.1 - 46.9 * (2/3)); % pi * R^2 * h
masseOxygeneBasReservoir = 631000 * volumeOxygeneBasReservoir / (volumeOxygeneBasReservoir + hautReservoir.CalculerVolume());
masseOxygeneHautReservoir = 631000 - masseOxygeneBasReservoir;

cmCyl1 = CentreDeMasse.CentreDeMasseCylindre(basReservoir.Rayon, 46.9 * (2/3));
cmCyl2 = CentreDeMasse.CentreDeMasseCylindre(basReservoir.Rayon, 39.1 - 46.9 * (2/3));
cmCyl2(3) = cmCyl2(3) + 46.9 * (2/3);
basReservoir.CentreDeMasse = CentreDeMasse.CentreDeMasseObjets([cmCyl1; cmCyl2], [masseHydrogeneBasReservoir; masseOxygeneBasReservoir]);

reservoir = FormeFusee(basReservoir, hautReservoir);
reservoir.CoordonneesBasMilieu(0, basNavette.Rayon + basReservoir.Rayon, 0);
basReservoir.Masse = masseHydrogeneBasReservoir + masseOxygeneBasReservoir;
hautReservoir.Masse = masseOxygeneHautReservoir;

reservoir.RepartirMasseParComposante(basReservoir.Masse, hautReservoir.Masse);

%Calcul de l'inertie totale du réservoir
reservoir.CalculerInertie();

% Propulseur
mPropulseur = 469000;

basPropulseur = Cylindre();
basPropulseur.Rayon = 1.855;
basPropulseur.Hauteur = 39.9;
basPropulseur.CentreDeMasse = CentreDeMasse.CentreDeMasseCylindre(basPropulseur.Rayon, basPropulseur.Hauteur); % CM si le bas du cylindre est à l'origine

hautPropulseur = Cone();
hautPropulseur.Rayon = 1.855;
hautPropulseur.Hauteur = 5.6;
hautPropulseur.CentreDeMasse = CentreDeMasse.CentreDeMasseCone(hautPropulseur.Rayon, hautPropulseur.Hauteur); % CM si le bas du cylindre est à l'origine


% Propulseur gauche
propulseurGauche = FormeFusee(copy(basPropulseur), copy(hautPropulseur));
propulseurGauche.CoordonneesBasMilieu(- (basReservoir.Rayon + basPropulseur.Rayon), basNavette.Rayon + basReservoir.Rayon, 0);
propulseurGauche.RepartirMasseUniforme(mPropulseur);

% Propulseur droit
propulseurDroit = FormeFusee(copy(basPropulseur), copy(hautPropulseur));
propulseurDroit.CoordonneesBasMilieu(basReservoir.Rayon + basPropulseur.Rayon, basNavette.Rayon + basReservoir.Rayon, 0);
propulseurDroit.RepartirMasseUniforme(mPropulseur);

%Calcul de l'inertie du propulseur gauche
propulseurGauche.CalculerInertie();

%Calcul de l'inertie du propulseur droit
propulseurDroit.CalculerInertie();




