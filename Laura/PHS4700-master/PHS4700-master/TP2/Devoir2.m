function [coup, vbf, t, x, y, z] = Devoir2(option, xy0, vb0, wb0)

    rayon_balle = 21.35/1000; % pour avoir en m
    dt = 0.00005; % choisi par essai erreur pour avoir une précision de +- 1 mm et un temps de simulation raisonnable
    vbMax = 100 ; %m/s
    
    % Inscription des conditions initiales dans les vecteurs
    t = 0;
    x = xy0(1);
    y = xy0(2);
    z = rayon_balle;
    
    % Actuelles = initiales (pour l'instant i = 1)
    vb = vb0;
    wb = wb0;
    
    % Initialisation de q (avec les valeurs initiales)
    q = [vb x y z];
    
    i = 2; % car tout est connu au moment initial (i = 1)
    
    pos = -1; % pour entrer dans le while
    
    % Tant que la simulation n'est pas terminée (trou, sol ou extérieur du
    % terrain n'est pas atteint)
    while (pos < 0)
        
        % Ajout temps actuel dans le vecteur du temps
        t = [t t(i-1) + dt];
        
        % Trouver q0 = (vx, vy, vz, x, y, z)
        q0 = q; % q0 est le 1 de l'itération précédente
        
        % Obtenir le bon g selon l'option
        switch option
            case 1
                g = @Option1;
            case 2
                g = @Option2;
            case 3
                g = @Option3;
        end
        
        % Utiliser Runge-Kutta pour trouver q = (vx, vy, vz, x, y, z)
        q = RungeKutta(q0, wb, dt, g);
        
        % Extraction de la vitesse
        vb = [q(1) q(2) q(3)];
        
        % Ajout de la positions dans les vecteurs x, y, et z
        x = [x q(4)];
        y = [y q(5)];
        z = [z q(6)];
        
        % Vérifier si la simulation s'arrête
        pos = CoupBalle(x(i), y(i), z(i));
        
        % Itérer pour passer au prochain moment
        i = i + 1;
    end
    
    coup = pos;
    vbf = vb;
    
end