% donne le vecteur unitaire (ur) sortant de la reflexion
% ui : vecteur unitaire du 
% ni : vecteur normale unitaire (sortant de la surface)
function ur = Reflexion (ui, i)
    % Eq (7.13)
    ur = ui - 2 * i * dot(ui, i);
end
