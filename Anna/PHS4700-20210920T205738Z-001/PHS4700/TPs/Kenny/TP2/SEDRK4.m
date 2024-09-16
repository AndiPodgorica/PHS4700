function qs = SEDRK4t0(q0, t0, Deltat, g, balle)
% Solution equations differentielles par methode de RK4
% Equation a resoudre : dq/dt=g(q,t)
% avec
%   qs        : solution [q(to+Deltat)]
%   q0        : conditions initiales [q(t0)]
%   Deltat    : intervalle de temps
%   g         : membre de droite de ED. 
%               C'est un m-file de matlab
%               qui retourne la valeur de g au temps choisi
k1 = feval(g, q0, t0, balle);
k2 = feval(g, q0 + k1 * Deltat / 2, t0 + Deltat / 2, balle);
k3 = feval(g, q0 + k2 * Deltat / 2, t0 + Deltat / 2, balle);
k4 = feval(g, q0 + k3 * Deltat, t0 + Deltat, balle);
qs = q0 + Deltat * (k1 + 2 * k2 + 2 * k3 + k4) / 6;
end