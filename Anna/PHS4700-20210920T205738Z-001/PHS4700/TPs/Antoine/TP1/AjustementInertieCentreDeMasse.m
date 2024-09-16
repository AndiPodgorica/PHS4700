function [ output_args ] = AjustementInertieCentreDeMasse( moment, masseObjet, centreDeMasseObjet, centreDeMasseGlobal )
%AjustementInertieCentreDeMasse Calcule le moment d'inertie ajusté en
%fonction de la position relative au centre de masse global.

dx = centreDeMasseGlobal(1) - centreDeMasseObjet(1);
dy = centreDeMasseGlobal(2) - centreDeMasseObjet(2);
dz = centreDeMasseGlobal(3) - centreDeMasseObjet(3);

dx2 = power(dx,2);
dy2 = power(dy,2);
dz2 = power(dz,2);

momentAjuste = [0 0 0 ;0 0 0;0 0 0];
momentAjuste(1,1) = moment(1,1) + (dy2 + dz2)*masseObjet;
momentAjuste(1,2) = moment(1,2) - (dx * dy)*masseObjet;
momentAjuste(1,3) = moment(1,3) - (dx * dz)*masseObjet;

momentAjuste(2,1) = moment(2,1) - (dy * dx)*masseObjet;
momentAjuste(2,2) = moment(2,2) + (dx2 + dz2)*masseObjet;
momentAjuste(2,3) = moment(2,3) - (dy * dz)*masseObjet;

momentAjuste(3,1) = moment(3,1) - (dz * dx)*masseObjet;
momentAjuste(3,2) = moment(3,2) - (dz * dy)*masseObjet;
momentAjuste(3,3) = moment(3,3) + (dx2 + dy2)*masseObjet;

output_args = momentAjuste;

end

