function [outArray item] = Pop(array)

if isempty(array)
    outArray = [];
    item = {};
    return;
end

if length(array) == 1
    outArray = [];
    item = array{1};
    return;
end

item = array{end};
outArray = {};
for i = 1:length(array)-1
    outArray{i} = array{i};
end
end
