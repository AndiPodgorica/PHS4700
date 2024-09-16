clear
%
% Procedure servant ра rouler le devoir 1
%
% Cas 1
posCas1=[0;0;0];
acmCas1=[0;0;0];
arCas1=0.0;
vaCas1=[0;0;0];
lambdaCas1=[1; 1; 1; 1; 1; 1];
[pcmCas1 acmCas1 MICas1 aaCas1]=Devoir1(posCas1,arCas1,vaCas1,lambdaCas1);
fprintf('\nCas 1\nConditions Cas 1\n');
fprintf('  Position drone (m) = ( %10.5f,  %10.5f,  %10.5f )\n',posCas1(1),posCas1(2),posCas1(3));
fprintf('  Rotation drone (r) = %10.5f\n',arCas1);
fprintf('  Vitesse angulaire drone (r/s) = ( %10.5f,  %10.5f,  %10.5f )\n',vaCas1(1),vaCas1(2),vaCas1(3));
fprintf('  Forces/Fmax (N) = ( %10.5f,  %10.5f,  %10.5f,  %10.5f,  %10.5f,  %10.5f  )\n',lambdaCas1(1),lambdaCas1(2),lambdaCas1(3),lambdaCas1(4),lambdaCas1(5),lambdaCas1(6));
fprintf('Resultats drone sur la piste \n');
fprintf('  Centre de masse (m) = ( %10.5f,  %10.5f,  %10.5f )\n',pcmCas1(1),pcmCas1(2),pcmCas1(3));
fprintf('  acceleration (m/s^2) = ( %10.5f,  %10.5f,  %10.5f ) \n',acmCas1(1),acmCas1(2),acmCas1(3));
fprintf('  Moment inertie (kg/m^2) =\n   %10.5f  %10.5f  %10.5f  \n   %10.5f  %10.5f  %10.5f  \n   %10.5f  %10.5f  %10.5f \n',...
     MICas1(1,1),MICas1(1,2),MICas1(1,3),MICas1(2,1),MICas1(2,2),MICas1(2,3),MICas1(3,1),MICas1(3,2),MICas1(3,3));
fprintf('  acc angulaire (r/s^2) = ( %10.5f,  %10.5f,  %10.5f ) \n\n',aaCas1(1),aaCas1(2),aaCas1(3));
%
% Cas 2
posCas2=[-3.5;2.0;40.0];
acmCas2=[0;0;0];
arCas2=0.2;
vaCas2=[0.0; 0.05; 0.01];
lambdaCas2=[0.4; 0.5; 0.6; 0.6; 0.5; 0.4];
[pcmCas2 acmCas2 MICas2 aaCas2]=Devoir1(posCas2,arCas2,vaCas2,lambdaCas2);
fprintf('\nCas 2\nConditions Cas 2\n');
fprintf('  Position drone (m)= ( %10.5f,  %10.5f,  %10.5f  )\n',posCas2(1),posCas2(2),posCas2(3));
fprintf('  Rotation drone (r) = %10.5f \n',arCas2);
fprintf('  Vitesse angulaire drone (r/s)= ( %10.5f,  %10.5f,  %10.5f )\n',vaCas2(1),vaCas2(2),vaCas2(3));
fprintf('  Forces/Fmax (N) = ( %10.5f,  %10.5f,  %10.5f,  %10.5f,  %10.5f,  %10.5f )\n',lambdaCas2(1),lambdaCas2(2),lambdaCas2(3),lambdaCas2(4),lambdaCas2(5),lambdaCas2(6));
fprintf('\nResultats drone en vol\n');
fprintf('  Centre de masse (m) = ( %10.5f,  %10.5f,  %10.5f )\n',pcmCas2(1),pcmCas2(2),pcmCas2(3));
fprintf('  acceleration (m/s^2) = ( %10.5f,  %10.5f,  %10.5f ) \n',acmCas2(1),acmCas2(2),acmCas2(3));
fprintf('  Moment inertie  (kg/m^2) =\n   %10.5f  %10.5f  %10.5f \n   %10.5f  %10.5f  %10.5f \n   %10.5f  %10.5f  %10.5f \n',...
     MICas2(1,1),MICas2(1,2),MICas2(1,3),MICas2(2,1),MICas2(2,2),MICas2(2,3),MICas2(3,1),MICas2(3,2),MICas2(3,3));
fprintf('  acc angulaire (r/s^2) = ( %10.5f,  %10.5f,  %10.5f )\n\n',aaCas2(1),aaCas2(2),aaCas2(3));
