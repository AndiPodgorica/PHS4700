
function [inside] = pointInRectangle(point, center, dim)
    minr = center - dim / 2;
    maxr = center + dim / 2;

    inside = point >= minr & point <= maxr;
    