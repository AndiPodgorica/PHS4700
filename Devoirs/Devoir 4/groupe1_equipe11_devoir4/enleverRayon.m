function [rayons,rayon]=enleverRayon(array)
rayon=array{end};
rayons={};
for i=1:length(array)-1
    rayons{i}=array{i};
end
end
