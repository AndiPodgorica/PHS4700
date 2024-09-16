function [pailleToucher] = detecterPailleToucher(p, xyp)
    rayonPaille = 0.005;
    hauteurPaille = 0.25;
    pailleToucher  = (rayonPaille^2 > (p(1) - xyp(1))^2 + (p(2) - xyp(2))^2) && (p(3) >= 0 && hauteurPaille > p(3));
end