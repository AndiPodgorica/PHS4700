%
% Rouler Devoir 4
%
% 
%
format long
clear;
%
rayonVerre=0.04;
%
% eau 
%
xeau=rayonVerre*cos([0:30]*pi/15);
yeau=rayonVerre*sin([0:30]*pi/15);
for simulation=1:4
  if simulation==1
    disp('Simulation 1');
    poso=[0;0.1;0.1];
    xyp=[0.02;0.01];
    he=0.15;
  elseif simulation==2
    disp('Simulation 2');
    poso=[0.1;0;0.1];
    xyp=[0.02;0.01];
    he=0.15;
  elseif simulation==3
    disp('Simulation 3');
    poso=[0.1;0;0.3];
    xyp=[0.02;0.01];
    he=0.2;
    elseif simulation==4
    disp('Simulation 4');
    poso=[0.1;0;-0.1];
    xyp=[0;0];    
    he=0.2;
  end
  plot3(poso(1),poso(2),poso(3),'ko');
  ztop=he*ones(31,1);
  zbot=0*ones(1,31);
  line(xeau,yeau,ztop);
  line(xeau,yeau,zbot);
  for ii=1:31
    line([xeau(ii) xeau(ii)],[yeau(ii) yeau(ii)],[zbot(ii) ztop(ii)]);
  end
  axis equal
  hold
  [xi, yi, zi, couleur]=Devoir4(poso,xyp,he);
  nbpoint=length(couleur);
  orange=[0.929,0.694,0.125];
  for ipoint=1:nbpoint
    if couleur(ipoint) == 1
      plot3(xi(ipoint), yi(ipoint), zi(ipoint),'r.');
    elseif couleur(ipoint) == 2
      plot3(xi(ipoint), yi(ipoint), zi(ipoint), '.','Color',orange);
    elseif couleur(ipoint) == 3
      plot3(xi(ipoint), yi(ipoint), zi(ipoint),'m.');
    elseif couleur(ipoint) == 4
      plot3(xi(ipoint), yi(ipoint), zi(ipoint),'g.');
    elseif couleur(ipoint) == 5
      plot3(xi(ipoint), yi(ipoint), zi(ipoint),'b.');
    end
  end
  hold;
  pause;
  clearvars poso xi yi zi couleur
end