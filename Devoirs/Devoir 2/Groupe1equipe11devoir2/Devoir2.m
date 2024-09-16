function [Vf t x y z]=Devoir2(theta)
d=25; %Distance entre propulseur et CM (m)
Rt=6.371e6; %Rayon de la terre (m)

t=0; %Temps initial
dt=2.54; % Choisi par essaie erreur

vx=0; %Vitesse initiale
vy=0;
vz=0;

x=0; %Position initiale
y=0;
z=Rt+d;

vitesseAngulaireX=0; %Petit omega

positionAngulaireX=0; %Grand omega

q=[vx vy vz x y z vitesseAngulaireX positionAngulaireX]; %Initialisation de q avec les valeurs initiales

i=2; %Tout est connu au moment initial


    while true
        t=[t;t(i-1)+dt];
    
        q0=q; %Mettre l'etat present en etat passé
        
        masse=trouverMasse(t(i-1)+dt);
        
        g=@fonctionG;

        q=SEDRK4t0(q0,t(i-1),dt,g,masse,theta); %Runge-Kutta pour trouver q=(vx vy vz x y z w,alpha)
 
        vx=q(1);
        vy=q(2);
        vz=q(3);
    
        x=[x q(4)];
        y=[y q(5)];
        z=[z q(6)];
        
        vitesseAngulaireX=q(7);
        positionAngulaireX=q(8);
                
        if doitTerminer(x(i), y(i), z(i)) == true %Verifie si simulation s'arrete
            break;
        end
        i=i+1;
    end
    
    Vf=[vx vy vz];
end