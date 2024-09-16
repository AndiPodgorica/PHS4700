function Geometrie(ifig,BlocOutr,BlocOutz,Lame,Oeil);
%
%  Oeil
%
plot3([Oeil(1)],[Oeil(2)],[Oeil(3)],'ko');
%
% Cylindre transparent
%
xtb=BlocOutr(1)+BlocOutr(3)*cos([0:20]*pi/10);
ytb=BlocOutr(1)+BlocOutr(3)*sin([0:20]*pi/10);
ztop=BlocOutz(2)*ones(21,1);
zbot=BlocOutz(1)*ones(1,21);
line(xtb,ytb,ztop);
line(xtb,ytb,zbot);
for ii=1:21
  line([xtb(ii) xtb(ii)],[ytb(ii) ytb(ii)],[zbot(ii) ztop(ii)]);
end
if ifig == 0
%
% Lame de verre
%
Face1x=[Lame(1,1) Lame(1,1) Lame(1,1) Lame(1,1) Lame(1,1)];
Face2x=[Lame(1,2) Lame(1,2) Lame(1,2) Lame(1,2) Lame(1,2)];
Face12y=[Lame(2,1) Lame(2,2) Lame(2,2) Lame(2,1) Lame(2,1)];
Face12z=[Lame(3,1) Lame(3,1) Lame(3,2) Lame(3,2) Lame(3,1)];

Face34x=[Lame(1,1) Lame(1,2) Lame(1,2) Lame(1,1) Lame(1,1)];
Face3y=[Lame(2,1) Lame(2,1) Lame(2,1) Lame(2,1) Lame(2,1)];
Face4y=[Lame(2,2) Lame(2,2) Lame(2,2) Lame(2,2) Lame(2,2)];
Face34z=Face12z;

Face56x=Face34x;
Face56y=[Lame(2,1) Lame(2,1) Lame(2,2) Lame(2,2) Lame(2,1)];
Face5z=[Lame(3,1) Lame(3,1) Lame(3,1) Lame(3,1) Lame(3,1)];
Face6z=[Lame(3,2) Lame(3,2) Lame(3,2) Lame(3,2) Lame(3,2)];

%line(Face1x,Face12y,Face12z);
%line(Face2x,Face12y,Face12z);
%line(Face34x,Face3y,Face34z);
%line(Face34x,Face4y,Face34z);
%line(Face56x,Face56y,Face5z);
%line(Face56x,Face56y,Face6z);
%fill3(Face1x,Face12y,Face12z,'r');
%fill3(Face2x,Face12y,Face12z,'c');
%fill3(Face34x,Face3y,Face34z,'g');
%fill3(Face34x,Face4y,Face34z,'y');
%fill3(Face56x,Face56y,Face5z,'b');
%fill3(Face56x,Face56y,Face6z,'m');
plot3(Face1x,Face12y,Face12z,'r');
plot3(Face2x,Face12y,Face12z,'c');
plot3(Face34x,Face3y,Face34z,'g');
plot3(Face34x,Face4y,Face34z,'y');
plot3(Face56x,Face56y,Face5z,'b');
plot3(Face56x,Face56y,Face6z,'m');

end
