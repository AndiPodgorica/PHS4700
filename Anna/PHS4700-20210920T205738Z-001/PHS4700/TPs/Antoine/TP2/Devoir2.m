function [prise vf x y z t]=Devoir2(option,vi)

definitions();

Calculs.gravite(Balle);

s = Sortie();
[result, prise] = Simulation('g1', vi, Balles(3), 0, s, zonePrise);

g = 'g1';

if (option == 2)
    g = 'g2';
else
if (option == 3)
    g = 'g3';
end
end

vf = [s.vx(end) s.vy(end) s.vz(end)]';
x = s.x';
y = s.y';
z = s.z';
t = s.t';
    
end

