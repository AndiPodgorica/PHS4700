function c=QConjugue(a)
%
% Conjuguer un quaternion
% 
c=horzcat([a(1)], -a(2:4));
