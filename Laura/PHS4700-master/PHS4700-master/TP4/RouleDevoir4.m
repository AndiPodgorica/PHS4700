%
% Rouler Devoir 4
%
% 
%
format long
clear;
%
%  Définir les cas
%
BlocOutr=[4 4 2];
BlocOutz=[2 20];
Lame=[3 4; 3 5; 12 17];
nout=[1 1   1   1.2];
nin=[1  1.5 1.5 1];
dep=[0 0 5; 0 0 5; 0 0 0; 0 0 5];
clf;
hold;
Geometrie(0,BlocOutr,BlocOutz,Lame,dep(3,:));
axis equal
hold;
for itst=1:4
  clf;
  hold;
  Geometrie(1,BlocOutr,BlocOutz,Lame,dep(itst,:));
  axis equal
  [xi yi zi face]=Devoir4(nout(itst),nin(itst),dep(itst,:));
  nbpoint=length(face);
  for ipoint=1:nbpoint
    if face(ipoint) == 1
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'r.');
    elseif face(ipoint) == 2
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'c.');
    elseif face(ipoint) == 3
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'g.');
    elseif face(ipoint) == 4
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'y.');
    elseif face(ipoint) == 5
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'b.');
    elseif face(ipoint) == 6
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'m.');
    end
  end
  hold;
  pause
end
