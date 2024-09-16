%this is the main function
%   INPUT:  posCas : la position de l'origine du ref lie au patineur
%           muCas  : l'angle de rotation
%           vaCas  : la vitesse angulaire du patineur autour de l'axe passant par son centre demasse
%           ficas  : le vecteur de la force ecrit dans le ref lie au patineur
%   OUTPUT: pcm :  la position du centre de masse du patineur (ref laboratoire)              
%           MI  :  la matrice de moment d'inertie I du patineur par rapport a son centre de masse    
%           aa  :  l'acceleration angulaire du patineur autour de son centre de masse ref laboratoire)  
%                

function [pcm MI aa] = Devoir1(posCas,muCas,vaCas,fiCas)
    pcm  = CalculerCentreMasse(posCas,muCas);   
    % pour tester la fonction CalculerCentreMasse uncomment bellow 
    % centreMasseSysteme  = CalculerCentreMasse(0,0);
    % disp(centreMasseSysteme);
    MI = momentInertie.momentInertieTotal(posCas,muCas);
    
    aa = CalculerAccelAngulaire(MI, pcm, vaCas, fiCas);
end