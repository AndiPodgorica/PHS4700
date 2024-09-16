function [pcm, MI, aa]=Devoir1(pos,mu,va,fi)
ms = 1.5;      % masse de la demi-sphere pleine (kg)
Rs = 0.3;       % rayon de la demi-sphere pleine (m)
Lb = 0.5;       % longueur d'un bras (m)
Rb = 0.025;     % rayon d'un bras (m)
mb = 0.2;      % masse d'un bras (kg)
Hm = 0.1;       % hauteur du moteur (m)
Rm = 0.05;      % rayon du moteur (m)
mm = 0.4;      % masse du moteur (kg)
mc = 1.2;      % masse du colis (kg)
Lc = 0.7;       % longueur du colis (m)
lc = 0.4;       % largeur du colis (m)
Hc = 0.25;      % hauteur du colis (m)
rc_boite_donnee = [0; 0.1; -0.125];     % centre de masse du colis (donne)
Fmax = 25;      % force maximale des moteurs

% calcul des centres de masse
rc_demi_sphere = [0;0;3*Rs/8];
rc_tiges = horzcat([Rs+Lb/2; 0; Rb], [0; Rs+Lb/2; Rb], [-(Rs+Lb/2); 0; Rb], [0; -(Rs+Lb/2); Rb]);
rc_moteurs = horzcat([Rs+Lb+Rm; 0; Hm/2], [0; Rs+Lb+Rm; Hm/2], [-(Rs+Lb+Rm); 0; Hm/2], [0; -(Rs+Lb+Rm); Hm/2]);
rc_boite = rc_boite_donnee;
rc_total = (rc_demi_sphere * ms + rc_tiges*[1;1;1;1].*mb + rc_moteurs*[1;1;1;1].*mm + mc * rc_boite)/(ms+4*mb+4*mm+mc);
Ry = matrice_de_rotation(mu, 'y');
pcm = Ry*(rc_total) + pos;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% calcul des moments d'inerties aux centres de chaque composant 
Ic_demi_sphere = (ms*Rs*Rs).*[83/320 0 0; 0 83/320 0; 0 0 2/5];
Ic_tige_z = mb*[Rb*Rb/2+Lb*Lb/12 0 0; 0 Rb*Rb/2+Lb*Lb/12 0; 0 0 Rb*Rb];
Ic_moteur = mm*[Rm*Rm/4+Hm*Hm/12 0 0; 0 Rm*Rm/4+Hm*Hm/12 0; 0 0 Rm*Rm/2];
Ic_boite = (mc/12)*[lc^2+Hc^2 0 0; 0 Lc^2+Hc^2 0; 0 0 Lc^2+lc^2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ramener tous les centres de masse au centre de masse du drones 
dc_demi_sphere = rc_demi_sphere - rc_total;
dc_tiges = rc_tiges - rc_total*[1 1 1 1];
dc_moteurs = rc_moteurs - rc_total*[1 1 1 1];
dc_boite = rc_boite - rc_total;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ramener tous les moments d'inerties au centre de masse du drones 
Id_demi_sphere = Ic_demi_sphere + ms * T_d(dc_demi_sphere);
Id_boite = Ic_boite + mc * T_d(dc_boite);
I = Id_demi_sphere + Id_boite;

angles = [-pi/2;-pi/2;pi/2;pi/2];
axes = ['y';'x';'y';'x'];
for i = 1:4
    R = matrice_de_rotation(angles(i), axes(i));
    Ic_tige =  R * Ic_tige_z * R';
    Id_tige_i = Ic_tige + mb * T_d(dc_tiges(:,i));
    Id_moteur_i = Ic_moteur + mm * T_d(dc_moteurs(:,i));
    I = I + Id_tige_i + Id_moteur_i;
end

MI = Ry * I * Ry';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% calcul de l'acc angulaire 
z = [0; 0; 1];
T = Ry * cross(dc_moteurs,Fmax * z * fi')*[1;1;1;1];
tmp = T + cross(MI*va,va);
aa = inv(MI) * tmp;
