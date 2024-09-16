function [qs m Err]=SEDRK4t0ER(q0,t0,tf,epsilon,g)
% Contrôle d'erreur pour solution ED avec 
% interpolation de Richardson
% Equation a resoudre : dq/dt=g(q,t)
% avec
%   qs        : solution [q(tf)]
%   q0        : conditions initiales [q(t0)]
%   t0        : temps initial
%   tf        : temps final
%   epsilon   : précision pour chaque variable
%   g         : membre de droite de ED. 
m=1;nbi=1;DeltaT=(tf-t0);
% Solution avec m=1
qs1=SEDRK4t0(q0,t0,DeltaT,'g');
[conv Err]=ErrSol(qs1,q0,epsilon);
qs2=qs1;
% Iteration avec m>1
while not(conv)
  DeltaT=DeltaT/2;
  m=m+1;nbi=nbi*2;
  qs2=q0;t2=t0;
  for i=1:nbi
    qs2=SEDRK4t0(qs2,t2,DeltaT,'g');
    t2=t2+DeltaT;
  end;
  [conv Err]=ErrSol(qs2,qs1,epsilon);
  qs1=qs2;
  if m>10
    break;
  end;
end
qs=qs2+Err/15;
