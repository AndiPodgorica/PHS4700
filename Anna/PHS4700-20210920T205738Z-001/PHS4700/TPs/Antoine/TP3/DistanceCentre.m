function d= DistanceCentre (centre1, centre2 )
%Retourne la distance entre 2 points

d = sqrt((centre1(1)-centre2(1))^2 +(centre1(2)-centre2(2))^2+(centre1(3)-centre2(3))^2);
end