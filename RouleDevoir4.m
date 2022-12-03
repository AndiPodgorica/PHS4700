%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Roule Devoir 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc ; clear all ; format loose %compact 
format long;
close all ; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Définir les cas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rad=8;
aa=2;
bb=1;
cc=4;
dim = [-2 2; -1 1; 0 4];
nout = [1 1   1   1.5];
nin  = [1.5  1.5 1.5 1];
Robs  = [20 20 10; 0 20 2; 0 0 10; 0 0 10];

for itst=1:1
  tic
  clf;
  hold;
  xlabel('x(cm)');
  ylabel('y(cm)');
  zlabel('z(cm)');
  plot3([Robs(itst,1)],[Robs(itst,2)],[Robs(itst,3)],'ko');
  [x, y, z] = sphere(10);
  xsphere=rad*x;
  ysphere=rad*y;
  zsphere=rad*z;
  h=surf(xsphere, ysphere, zsphere);
  set(h,'FaceAlpha',0.1,'FaceColor','none')
  Facexy=[bb bb -bb -bb bb];
  Facexz=[0 cc cc 0 0];
  Faceyx=[aa -aa -aa aa aa];
  Faceyz=[0 0 cc cc 0];
  Facezx=[aa -aa -aa aa aa];
  Facezy=[bb bb -bb -bb bb];

  line([-aa -aa -aa -aa -aa],Facexy,Facexz,'Color','c');
  line([aa aa aa aa aa],Facexy,Facexz,'Color','b');
  line(Faceyx,[-bb -bb -bb -bb -bb],Faceyz,'Color',[0.9290 0.6940 0.1250]);
  line(Faceyx,[bb bb bb bb bb],Faceyz,'Color','r');
  line(Facezx,Facezy,[0 0 0 0 0],'Color','m');
  line(Facezx,Facezy,[cc cc cc cc cc],'Color','g');
  axis equal
  [xi,yi,zi,face]=Devoir4(Robs(itst,:),nout(itst),nin(itst));
  nbpoint=length(face);
  for ipoint=1:nbpoint
    if face(ipoint) == 1
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'c.');
    elseif face(ipoint) == 2
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'b.');
    elseif face(ipoint) == 3
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'Color',[0.9290 0.6940 0.1250]);
    elseif face(ipoint) == 4
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'r.');
    elseif face(ipoint) == 5
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'m.');
    elseif face(ipoint) == 6
      plot3([xi(ipoint)],[yi(ipoint)],[zi(ipoint)],'g.');
    end
  end
  hold;
  toc
  pause
end
