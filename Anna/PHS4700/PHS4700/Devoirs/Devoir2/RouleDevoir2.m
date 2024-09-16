%
% Definir terrain
%
xter=[0 120 120   0   0];
yter=[0   0  90  90   0];
zter=[0   0   0   0   0];
Butsgx=[0 0 0 0]; 
Butsdx=[120 120 120 120]; 
Butsy=[(90-7.32)/2 (90-7.32)/2 (90+7.32)/2 (90+7.32)/2];
Butsz=[0 2.44 2.44 0];
%Tir 1
xy0([1:2],1)=[0.2;89.8];
vbi([1:3],1)=[5.3;-21;16.5];
wbi([1:3],1)=[0;0;6.3];
%Tir 2
xy0([1:2],2)=[0.2;89.8];
vbi([1:3],2)=[5.3;-21;16.5];
wbi([1:3],2)=[0;-5;-6.3];
%Tir 3
xy0([1:2],3)=[0.2;89.8];
vbi([1:3],3)=[5.3;-21;16.5];
wbi([1:3],3)=[0;0;-6.3];
%Tir 4 Valeurs de vbi et wbi à déterminer par les étudiants
xy0([1:2],4)=[0;1];
vbi([1:3],4)=[10;10;10];
wbi([1:3],4)=[0;0;0];
for vit=1:4
  clf;
  hold;
  xlabel('x(m)');
  ylabel('y(m)');
  zlabel('z(m)');
%
%  Tracer terrain 
%
  fprintf('\nSimulation %3d\n',vit);
  fprintf('rbi (m)  = (%8.4f,%8.4f,%8.4f)  \n',xy0(1,vit),xy0(2,vit),0.11);
  fprintf('vbi (m/s)= (%8.4f,%8.4f,%8.4f)  \n',vbi(1,vit),vbi(2,vit),vbi(3,vit));
  fprintf('wbi (r/s)= (%8.4f,%8.4f,%8.4f)  \n',wbi(1,vit),wbi(2,vit),wbi(3,vit));
  axis equal;
  plot3(xter,yter,zter,[0 1 0]);
  line(Butsgx,Butsy,Butsz,'color','b');
  line(Butsdx,Butsy,Butsz,'color','b');
  plot3(xy0(1,vit),xy0(2,vit),0.11,'r+');
  [But vbf tt xx yy zz]=Devoir2(xy0(:,vit),vbi(:,vit),wbi(:,vit));
  sz=size(tt,2);
  plot3(xx(1:sz),yy(1:sz),zz(1:sz),'b')
  if But == 0
    fprintf('But ! \n');
  elseif But == 1
    fprintf('Le ballon touche le sol en premier\n');
  elseif But == 2
    fprintf('Le ballon sort du terrain en premier\n');
  elseif But == 3
    fprintf('Le ballon touche les montants du but en premier\n');
  end
  fprintf('Temps de la collision          %10.6f s \n',tt(sz));
  fprintf('Position finale de la balle    (%8.4f,%8.4f,%8.4f)  m \n',xx(sz),yy(sz),zz(sz));
  fprintf('Vitesse finale de la balle     (%8.4f,%8.4f,%8.4f)  m/s\n',vbf(1),vbf(2),vbf(3));
  fprintf('\n\n');
  hold;
  pause;
end
