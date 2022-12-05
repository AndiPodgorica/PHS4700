function [unitaireI,unitaireJ]=calculerIJ(posObservateur)
unitaireI=[posObservateur(2);-posObservateur(1);0];

if (norm(unitaireI)==0)
    unitaireI=[0;posObservateur(3);-posObservateur(2)];
end

unitaireJ=cross(posObservateur,unitaireI);
unitaireI=unitaireI/norm(unitaireI); %Transformer i,j,posObservateur en vecteur unitaire
unitaireJ=unitaireJ/norm(unitaireJ);
end