function [conv Err]=ErrSol(qs1,qs0,epsilon)
% Verification si solution convergee
%   conv      : variable logique pour convergence
%               Err<epsilon pour chaque elements
%   Err       : Difference entre qs1 et qs0 
%   qs1       : nouvelle solution
%   qs0       : ancienne solution
%   epsilon   : précision pour chaque variable
nbele=length(qs0);
Err=(qs1-qs0);
conv=1;
for i=1:nbele
  conv=conv & abs(Err(i)) < epsilon(i);
end
