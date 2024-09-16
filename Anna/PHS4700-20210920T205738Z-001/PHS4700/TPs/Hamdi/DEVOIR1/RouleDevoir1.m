clear
%
% Procedure servant à rouler le devoir 1
%
% Cas 1
posCas1=[0;0;0];
muCas1=0.0;
vaCas1=[0;0;0];
fiCas1=[1; 1; 1;1];
[pcmCas1 MICas1 aaCas1]=Devoir1(posCas1,muCas1,vaCas1,fiCas1);
fprintf('\nCas 1\nConditions initiales\n');
fprintf('  Position drone (m) = ( %10.5f,  %10.5f,  %10.5f )\n',posCas1(1),posCas1(2),posCas1(3));
fprintf('  Rotation drone (r) = %10.5f\n',muCas1);
fprintf('  Vitesse angulaire drone (r/s) = ( %10.5f,  %10.5f,  %10.5f )\n',vaCas1(1),vaCas1(2),vaCas1(3));
fprintf('  Forces (N) = ( %10.5f,  %10.5f,  %10.5f,  %10.5f ) \n',fiCas1(1),fiCas1(2),fiCas1(3),fiCas1(4));
fprintf('Resultats avion sur la piste \n');
fprintf('  Centre de masse (m) = ( %10.5f,  %10.5f,  %10.5f )\n',pcmCas1(1),pcmCas1(2),pcmCas1(3));
fprintf('  Moment inertie (kg/m^2) =\n   %10.5f & %10.5f & %10.5f  \n   %10.5f & %10.5f & %10.5f  \n   %10.5f & %10.5f & %10.5f \n',...
     MICas1(1,1),MICas1(1,2),MICas1(1,3),MICas1(2,1),MICas1(2,2),MICas1(2,3),MICas1(3,1),MICas1(3,2),MICas1(3,3));
fprintf('  acc angulaire (r/s^2) = ( %10.5f,  %10.5f,  %10.5f ) \n\n',aaCas1(1),aaCas1(2),aaCas1(3));
%
% Cas 2
posCas2=[2.5;0.0;30.5];
muCas2=0.05;
vaCas2=[0.0; 0.05; 0.001];
fiCas2=[0.4; 0.5; 0.6; 0.5];
[pcmCas2 MICas2 aaCas2]=Devoir1(posCas2,muCas2,vaCas2,fiCas2);
fprintf('\nCas 2\nConditions initiales\n');
fprintf('  Position drone = ( %10.5f,  %10.5f,  %10.5f )\n',posCas2(1),posCas2(2),posCas2(3));
fprintf('  Rotation drone (r) = %10.5f \n',muCas2);
fprintf('  Vitesse angulaire drone (r/s)= ( %10.5f,  %10.5f,  %10.5f )\n',vaCas2(1),vaCas2(2),vaCas2(3));
fprintf('  Forces/Fmax (N) = ( %10.5f,  %10.5f,  %10.5f,  %10.5f )\n',fiCas2(1),fiCas2(2),fiCas2(3),fiCas2(4));
fprintf('\nResultats drone en vol\n');
fprintf('  Centre de masse (m) = ( %10.5f,  %10.5f,  %10.5f )\n',pcmCas2(1),pcmCas2(2),pcmCas2(3));
fprintf('  Moment inertie  (kg/m^2) =\n   %10.5f & %10.5f & %10.5f \\\\ \n   %10.5f & %10.5f & %10.5f \\\\ \n   %10.5f & %10.5f & %10.5f \\\\ \n',...
     MICas2(1,1),MICas2(1,2),MICas2(1,3),MICas2(2,1),MICas2(2,2),MICas2(2,3),MICas2(3,1),MICas2(3,2),MICas2(3,3));
fprintf('  acc angulaire (r/s^2) = ( %10.5f,  %10.5f,  %10.5f )\n\n',aaCas2(1),aaCas2(2),aaCas2(3));
