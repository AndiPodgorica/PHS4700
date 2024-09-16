function [centreMasseSysteme] = CalculerCentreMasse(pos, muCas)
    % pos :  la position de l'origine du ref lie au patineur
    % muCas : l'angle de roation 
       
    %jambes 
    Rj = 0.06;
    Lj = 0.75;
    Pj = 1052;
    CMjD = [0.10;0;Lj/2]; %jambe droite
    CMjG = [-0.10;0;Lj/2]; %jambe gauche

    MjD = CalculerMasse("cylindre",Rj,Lj,Pj);
    MjG = CalculerMasse("cylindre",Rj,Lj,Pj);

    %tronc
    Rt = 0.15;
    Lt = 0.7;
    Pt = 953;
    CMt = [0;0;Lj+(Lt/2)];

    Mt = CalculerMasse("cylindre",Rt,Lt,Pt);

    %cou 
    Rc = 0.04;
    Lc = 0.1;
    Pc = 953;
    CMc = [0;0;Lj+Lt+(Lc/2)];

    Mc = CalculerMasse("cylindre",Rc,Lc,Pc);

    %tete 
    Rh = 0.1;
    Ph = 1056;
    CMh = [0;0;Lj+Lt+Lc+Rh];

    Mh = CalculerMasse("sphere",Rh,0,Ph);

    %bras
    Rb = 0.03;
    Lb = 0.75;
    Pb = 1052;
    %alignes avec le corps if muCas == 0
    CMbD = [Rt+Rb;0;Lj+Lt-(Lb/2)]; %bras droit aligne avec le corps
    CMbG = [-(Rt+(Lb/2));0;Lj+Lt-Rb]; % bras gauche perpendiculiare au tronc
    %perpendiculaire au tronc if muCas != 0
%     if(muCas ~= 0)
%         CMbD = [Rt+(Lb/2);0;Lj+Lt-Rb];
%         CMbG = [-Rt+(Lb/2);0;Lj+Lt-Rb];
%     end

    MbD = CalculerMasse("cylindre",Rb,Lb,Pb);
    MbG = CalculerMasse("cylindre",Rb,Lb,Pb);

    masseTotal = MjD+MjG+Mt+Mc+Mh+MbD+MbG;

    %centre de masse
    sumCentreMasse = (CMjD*MjD)+(CMjG*MjG)+ ...
                     (CMt*Mt)+ ...
                     (CMc*Mc)+ ...
                     (CMh*Mh)+ ...
                     (CMbD*MbD)+(CMbG*MbG);
    disp(sumCentreMasse);
    centreMasseSysteme = ((1/masseTotal)*sumCentreMasse)+ pos; 
    
end
