% donne le vecteur unitaire sortant (ut) de la réfraction
% ui : vecteur unitaire entrant
% i : vecteur unitaire normal à la surface du plan
% ni : indice de réfraction du milieu i
% nt : indice de réfraction du milieu t

function [ut, estRefracte] = Refraction(ui, i, ni, nt)
estRefracte = true;
%vecteurs unitaires
ui = ui / norm(ui);
i = i / norm(i);

angleCritique = abs(asin(nt/ni));

% Eq (7.10)
j = cross(ui, i) / norm(cross(ui, i));
% Eq (7.11)
k = cross(i, j);

% Eq (7.30)
sini = dot(ui, k);
% Angle d'incidence
anglei = asin(sini);

    if -angleCritique <= anglei && anglei <= angleCritique
        % Eq (7.31)
        sint = ni/nt * sini;
        
        % cos^2 + sin^2 = 1
        % cos = (1 - sin^2)^(1/2)
        
        % Eq (7.36)
        ut = -i * sqrt(1 - power(sint, 2)) + k * sint;
    else
        ut = [0 0 0]';
        estRefracte = false;
    end
end
