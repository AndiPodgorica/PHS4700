clear;
RT=6.371e6;
angle=0:0.002:2*pi;
xTerre=RT*cos(angle);
yTerre=RT*sin(angle);
fill(xTerre,yTerre,'b');
axis equal;
  hold;
  xlabel('y(m)')
  ylabel('z(m)')
% Valeur de thêta à/ modifier
  theta=0.000014;
[Vf t x y z]=Devoir2(theta);
  sz=size(t,1);
  plot(y,z,'r')
 fprintf('Angle thêtan          %10.9f rad \n',theta);
 fprintf('Temps final          %10.6f s \n',t(sz));
 fprintf('Vitesse finale          %10.6f m/s \n',Vf);
 fprintf('Position finale        ( %10.0f   , %10.0f   ,%10.0f )m \n',x(sz),y(sz),z(sz));