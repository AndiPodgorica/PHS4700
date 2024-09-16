function [pcmNL, INL, alphaNL]=Devoir1(AngRot,vangulaire,forces,posNL)

	Donnees();
    
    centresDeMasse = [ navette.CentreDeMasse; reservoir.CentreDeMasse; propulseurGauche.CentreDeMasse; propulseurDroit.CentreDeMasse ];
    masses = [ navette.Masse; reservoir.Masse; propulseurGauche.Masse; propulseurDroit.Masse ];
    objets = [ navette; reservoir; propulseurGauche; propulseurDroit ];
    
    pcmNLCalcul = CentreDeMasse.CentreDeMasseObjets(centresDeMasse, masses);
  
    pcmNLCalcul = Rotation(AngRot, pcmNLCalcul);
    pcmNL = pcmNLCalcul + posNL;
    disp('pcmNL (Centre de masse du système navette-lanceur) = ');
    disp(pcmNL);
    
    %Ajustement de l'inertie par rapport au centre de masse
    navette.AjusterInertie(pcmNL);
    reservoir.AjusterInertie(pcmNL);
    propulseurGauche.AjusterInertie(pcmNL);
    propulseurDroit.AjusterInertie(pcmNL);
    
    %Somme de toutes les inerties
    INLCalcul = MomentInertie.InertieSysteme(objets, AngRot);
    INL = Rotation(AngRot, INLCalcul);
    disp('INL (Inertie du système navette-lanceur) = ');
    disp(INL);
    
    
    alphaNL = AccelerationAngulaire( AngRot, pcmNL, INL, vangulaire, forces );
    disp('alphaNL (acceleration angulaire) = ');
    disp(alphaNL);
    
end

