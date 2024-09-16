function aa = CalculerAccelAngulaire(MI, pos_CM, wz, Force)
    %decommenter les prochaines lignes pour tester
    %wz=10.0;
    %Force=[0; -200; 0];
    %MI = [1 0 0; 0 1 0; 0 0 1];
    %pos_CM = [-0.03; 0; 1.20];

    %constantes
    rh = 0.1; %rayon tete
    Lj = 0.75; %longeur jambe
    Lt = 0.70; %longeur torse
    Lc = 0.10; %longeur cou
    zf = Lj + Lt + Lc + rh; %pos de la force (en z)
    pos_force = [0;rh;zf]; %pos de la force (vecteur)
    v_angulaire = [0;0;wz]; %vitesse angulaire

    pos_force_CM = pos_force - pos_CM; %position de la force par rapport au centre de masse
    mforce = cross(pos_force_CM, Force); %moment de force
    mcinetique = MI * v_angulaire; %moment cinétique
    aa = MI\(mforce+cross(mcinetique, v_angulaire)); %MI \ x est = à INV(MI)*x
end