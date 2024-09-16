%
% Definir terrain
%
xter=[0  30  30 150 150   0   0];
yter=[0   0 130 130 150 150   0];
zter=[0   0   0   0   0   0   0];
theta=pi/10;
%
% Pour que la coupe paraisse sur le terrain 
% utiliser un rayon de 54 cm au lieu de 5.4 cm
%
for i=1:21
  xcoupe(i)=142+(5.4/10)*cos((i-1)*theta);
  ycoupe(i)=142+(5.4/10)*sin((i-1)*theta);
  zcoupe(i)=0.0;
end
for vit=1:4
  if vit == 1
    rbi=[13.10857 142];
    vbi=[30 0 21.052266]; %m/s
    wbi=[0  -450 0]; %m/s
  elseif vit == 2
    rbi=[15 120];
    vbi=[25.3132 20.3132 22.052266]; %m/s
    wbi=[170 -170 -420]; %m/s
  elseif vit == 3
    rbi=[13.6 130.766];
    vbi=[29.885 2.6146 21.052266]; %m/s
    wbi=[33.16095 -379.068156  0.0]; %m/s
  elseif vit == 4
    rbi=[13.3 130.];
    vbi=[29.885 2.6146 21.052266]; %m/s
    wbi=[0 -100.  -100.00000000]; %m/s

  end;
%
%  Tracer terrain, lanceur et zone des prises 
%
  clf;
  hold;
  fprintf('\nSimulation %3d\n',vit);
  xlabel('x(m)');
  ylabel('y(m)');
  zlabel('z(m)');
  axis equal;
  fill3(xter,yter,zter,[0 1 0]);
  fill3(xcoupe,ycoupe,zcoupe,[0 0 0]);
  for option=1:3
    if option == 1
      fprintf('Acceleration gravitationnelle seulement \n');
      type='r-';
    elseif option == 2
      fprintf('Acceleration gravitationnelle et force visqueuse \n');
      type='b-';
    elseif option == 3
      fprintf('Acceleration gravitationnelle, force visqueuse et force de Magnus\n');
      type='k-';
    end;
    fprintf('Position initiale de la balle [%12.8f %12.8f]  m \n',rbi(1),rbi(2));
    fprintf('Vitesse initiale de la balle  [%12.8f %12.8f %12.8f]  m/s \n',vbi(1),vbi(2),vbi(3));
    fprintf('Vitesse angulaire de la balle [%12.8f %12.8f %12.8f] rad/s \n',wbi(1),wbi(2),wbi(3));
    [coup vf t x y z ]=Devoir2(option,rbi,vbi,wbi);
    lastt=length(t);
    fprintf('\nLa simualtion se termine au temps %12.8f s \n',t(lastt));
    plot3(x,y,z,type);
    if coup == 0
      fprintf('Le golfeur a un trou d''un coup \n');
    elseif coup == 1
      fprintf('Le balle demeure sur le terrain \n');
    elseif coup == 2
      fprintf('Le balle sort du terrain \n');
    end
    fprintf('Vitesse finale de la balle     [%12.8f %12.8f %12.8f]  m/s\n',vf(1),vf(2),vf(3));
    fprintf('Position finale de la balle    [%12.8f %12.8f %12.8f]  m \n',x(lastt),y(lastt),z(lastt));
   fprintf('\n\n');
  end
  legend('Option 1','Option 2','Option 3') 
  pause;
  hold;
end