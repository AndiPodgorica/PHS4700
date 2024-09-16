function alpha=trouverAlpha(vitesse,positionAngulaireX)
orientationLocal=[0;0;1]; %Vecteur de l'axe OZ
matriceRotationOX=[1 0 0;0 cos(positionAngulaireX) -sin(positionAngulaireX);0 sin(positionAngulaireX) cos(positionAngulaireX)];

orientationGlobal=matriceRotationOX*orientationLocal;
denominateur = norm(orientationGlobal)* norm(vitesse);
    if(denominateur == 0)
        alpha = 0;
    else
        cosTheta = dot(orientationGlobal,vitesse)/denominateur;
        alpha = real(acos(cosTheta));
    end
end