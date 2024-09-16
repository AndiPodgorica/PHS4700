%Calcul le vecteur g de la force de viscosité d'une balle de ping-pong pour l'algorithme de Runge-Kutta .
%massBall: La masse de la balle
%rayon: Le rayon de la balle
    function g = frottementVisqueux(q0, t0, balle)
        rayon = 0.0199;
        masse = 0.00274;
        rho = 1.2;
        C = 0.5;
        aire = pi * rayon ^ 2;
       
        accelerationVisqueux = (- rho * C * aire / 2 * norm(q0(1,1:3)) * q0(1,1:3)) / masse;
        accelerationTotale = accelerationVisqueux + [0, 0, -9.8];
        g = [accelerationTotale(1) accelerationTotale(2) accelerationTotale(3) q0(1) q0(2) q0(3)];
    end

