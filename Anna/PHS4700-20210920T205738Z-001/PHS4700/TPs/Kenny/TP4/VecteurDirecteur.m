function omega = VecteurDirecteur(droite, angleVertical, angleHorizontal)
%     xResolution = 0.01;
%     composanteY = xResolution * tand(angleHorizontal);
%     hypothenuseXY = sqrt(xResolution^2 + composanteY^2);
%     composanteZ = hypothenuseXY / tand(angleVertical);
%     
%     norme = sqrt(xResolution^2 + composanteY^2 + composanteZ^2);
%     x = xResolution / norme;
%     y = composanteY / norme;
%     z = composanteZ / norme;
%     droite.Pente = Vecteur(x, y, z);

    x = sin(angleVertical) * cos(angleHorizontal);
    y = sin(angleVertical) * sin(angleHorizontal);
    z = cos(angleVertical);
    
    omega = [x y z];
    

    droite.Pente = Vecteur.CreateFromArray(omega);
end