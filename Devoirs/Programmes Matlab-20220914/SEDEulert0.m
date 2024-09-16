function qs=SEDEulert0(q0,t0,Deltat,g)
% Solution equations differentielles par methode de Euler
% Equation a resoudre : dq/dt=g(q,t)
% avec
%   qs        : solution [q(to+Deltat)]
%   q0        : conditions initiales [q(t0)]
%   Deltat    : intervalle de temps
%   g         : membre de droite de ED. 
%               C'est un m-file de matlab
%               qui retourne la valeur de g au temps choisi
qs=q0+feval(g,q0,t0)*Deltat;
