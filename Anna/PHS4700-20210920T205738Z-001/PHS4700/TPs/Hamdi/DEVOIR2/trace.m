function [] = trace(sim_nb)
    h = 3.5;                % hauteur de la calotte
    r = 15;                 % le rayon du vert
    
    R = -0.5*(h^2-r^2)/h;   % Rayon de la sphere
    [X,Y,Z] = sphere(50);
    X = X*R+92;
    Y = Y*R+53;
    Z = Z*R-(R-h);
    figure;
    X1 = X ; Y1 = Y ; Z1 = Z ;
    X1(Z<0) = NaN ; Y1(Z<0) = NaN ; Z1(Z<0) = NaN ;
  
    surf(X1,Y1,Z1, ones(size(Z1))*0.3,'HandleVisibility','off');
    hold on;
    fill3([0;60;110;110;0],[0;0;45;70;70],[0;0;0;0;0],'g','HandleVisibility','off');
    axis equal
    title(['Simulation ',num2str(sim_nb)])
end