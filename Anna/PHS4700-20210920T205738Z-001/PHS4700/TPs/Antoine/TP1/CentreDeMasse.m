function [ output_args ] = CentreDeMasse( centres, masses )
%CentreDeMasse Calcul le centre de masse global des objets
%   centres : Liste de vecteurs colonnes représentant les centres de masses
%             ex : [ x1 x2; y1 y2; z1 z2]
%   masses  : Liste de masse des solides 
%
% IMPORTANT : L'ordre des centre de masse doit être le même que celui des
%             masses puisque l'opération est une moyenne pondérée.
%
% Voir main.m exemple avec jambe gauche

masseTotale = sum(masses);

centre = [0;0;0];

for i = 1:numel(masses)
    x = centres(1, i);
    y = centres(2, i);
    z = centres(3, i);
    centreI = [x ; y ; z];
    poids = masses(i) / masseTotale;
    centreI = centreI * poids;
    
    centre = centre + centreI;
    
end
    
output_args = centre;

end

