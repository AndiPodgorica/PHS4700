
function [ moment ] = inertie( masse, rayon, hauteur, isSphere )
    moment = [1 0 0 ; 0 1 0; 0 0 1];

    if (isSphere)
        % Sphere
        %Ic,xx = Ic,yy = Ic,zz = (2m/3)(rayon^2)
        moment(1,1) = (2 * masse / 3) * rayon^2;
        moment(2,2) = moment(1,1);
        moment(3,3) = moment(1,1);
    else
        % Cylindre
        %Ic,zz = (m)*(r^2)
        moment(3,3) = masse * rayon^2;

        %Ic,xx = Ic,yy = (m/2)*(r^2) + (m/12)*(l^2)        
        moment(1,1) = ((masse / 2) * rayon^2) + ((masse / 12) * (hauteur^2));
        moment(2,2) = moment(1,1);
    end
end