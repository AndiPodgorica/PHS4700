function j=calculerJ(n,direction)
j=cross(direction/norm(direction),n/norm(n));
j=j/norm(j);
end
