%
% Devoir 3
% Collision auto-auto
% 
%
format long
clear;
Bloca=[4.78; 1.82]; %m
Colora=[0 0 1];
Blocb=[4.23; 1.6 ]; %m
Colorb=[1 0 0];
fTex=fopen('Resultats.txt','w');
%
%
for Simulation=1:6
  if Simulation == 1
    disp('Simulation 1');
    rai=[0 0];
    vai=[20  0 2];
    rbi=[100 100];
    vbi=[0  -20  -1];
    tbi=0.0;
  elseif Simulation == 2
    disp('Simulation 2');
    rai=[0 0];
    vai=[30  0 2];
    rbi=[100 100];
    vbi=[0 -30 -1];
    tbi=0.0;
  elseif Simulation == 3
    disp('Simulation 3');
    rai=[0 0];
    vai=[20 0 2];
    rbi=[100 50];
    vbi=[0 -10 0];
    tbi=1.6;
  elseif Simulation == 4
    disp('Simulation 4');
    rai=[0 0];
    vai=[ 10 10 1];
    rbi=[25 10];
    vbi=[ 10 0 0];
    tbi=0.0;
  elseif Simulation == 5
    disp('Simulation 5');
    rai=[0 0];
    vai=[20 0 2];
    rbi=[100 50];
    vbi=[0 -10 0];
    tbi=0.0;
  elseif Simulation == 6
    disp('Simulation 6');
    rai=[0 0];
    vai=[20 2 2];
    rbi=[100 10];
    vbi=[10  0 5];
    tbi=1.0;
  end
  clf;
  hold;
  Angai=atan2(vai(2),vai(1));
  [CoinsBloca NormalesBloca]=Bloc(Bloca,rai,Angai);
  Facexa=[CoinsBloca(1,1) CoinsBloca(1,2) CoinsBloca(1,3) CoinsBloca(1,4)];
  Faceya=[CoinsBloca(2,1) CoinsBloca(2,2) CoinsBloca(2,3) CoinsBloca(2,4)];
  fill(Facexa,Faceya,Colora);
  Angbi=atan2(vbi(2),vbi(1));
  [CoinsBlocb NormalesBlocb]=Bloc(Blocb,rbi,Angbi);
  Facexb=[CoinsBlocb(1,1) CoinsBlocb(1,2) CoinsBlocb(1,3) CoinsBlocb(1,4)];
  Faceyb=[CoinsBlocb(2,1) CoinsBlocb(2,2) CoinsBlocb(2,3) CoinsBlocb(2,4)];
  fill(Facexb,Faceyb,Colorb);
  xlabel('x(m)')
  ylabel('y(m)')
  axis equal
  [Coll tf raf vaf rbf vbf]=Devoir3(rai,vai,rbi,vbi,tbi);
  fprintf(fTex,'\nSimulation %1d\n',Simulation);
%  fprintf(fTex,'\\begin{table}[h]\n\\begin{center}\n\\caption{R\\''{e}sultat de la simulation %1d.}\\label{Sim%1d}\n',Simulation,Simulation);
%  fprintf(fTex,'\\vspace{0.2cm}\n\\begin{tabular}{|l|c|c|}\n \\hline \n');
  if Coll == 0 
    fprintf(fTex,'La collision a eu lieu \r\n');
  elseif Coll == 1 
    fprintf(fTex,'La collison n''a pas eu lieu \n');
  end;
  fprintf(fTex,'Le temps final est %8.6f s \n',tf);
  fprintf(fTex,'Paramètres initiaux                   bloc a                bloc b \n');
  fprintf(fTex,' x(0),y(0)) (m)                     (%8.4f ,%8.4f)      (%8.4f ,%8.4f)  \n',rai(1),rai(2),rbi(1),rbi(2));
  fprintf(fTex,' Theta_z(0) (rad)                      %8.4f                %8.4f               \n',Angai,Angbi);
  fprintf(fTex,'(v_x(0),v_y(0)) (m/s)               (%8.4f ,%8.4f)       (%8.4f ,%8.4f) \n',vai(1),vai(2),vbi(1),vbi(2));
  fprintf(fTex,' Omega_z(0) (r/s)                       %8.4f                %8.4f              \n',vai(3),vbi(3));
  fprintf(fTex,' Résultats \n');
  fprintf(fTex,' x(t_f),y(t_f)) (m)                 (%8.4f ,%8.4f)    (%8.4f ,%8.4f) \n',raf(1),raf(2),rbf(1),rbf(2));
  fprintf(fTex,' Theta_{z}(t_f) (r)                       %8.4f               %8.4f               \n',raf(3),rbf(3));
  fprintf(fTex,' (v_x(t_f), v_y(t_f))$ (m/s)        (%8.4f ,%8.4f)     (%8.4f ,%8.4f) \n',vaf(1),vaf(2),vbf(1),vbf(2));
  fprintf(fTex,' Omega_z(t_f) (r/s)                      %8.4f               %8.4f               \n',vaf(3),vbf(3));
  fprintf(fTex,' \n \n \n');
  [CoinsBlocaf NormalesBlocaf]=Bloc(Bloca,raf(1:2),raf(3));
  Facexaf=[CoinsBlocaf(1,1) CoinsBlocaf(1,2) CoinsBlocaf(1,3) CoinsBlocaf(1,4)];
  Faceyaf=[CoinsBlocaf(2,1) CoinsBlocaf(2,2) CoinsBlocaf(2,3) CoinsBlocaf(2,4)];
  fill(Facexaf,Faceyaf,Colora);
  [CoinsBlocbf NormalesBlocbf]=Bloc(Blocb,rbf(1:2),rbf(3));
  Facexbf=[CoinsBlocbf(1,1) CoinsBlocbf(1,2) CoinsBlocbf(1,3) CoinsBlocbf(1,4)];
  Faceybf=[CoinsBlocbf(2,1) CoinsBlocbf(2,2) CoinsBlocbf(2,3) CoinsBlocbf(2,4)];
  fill(Facexbf,Faceybf,Colorb);
%  clf
%  plot3(Post(2,:),Post(3,:),Post(4,:))
%  plot3(Post(5,:),Post(6,:),Post(7,:))
%  Bloc(CoteBloc,posblocf,avbloci,tfin)
  hold;
  pause;
  clearvars rai vai rbi vbi Coll tf raf vaf rbf vbf
end;
