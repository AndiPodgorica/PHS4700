function [phiMoins, phiPlus] = Phi(ro)
     rb=[4, 4, 11];
    Rb = 2;
   
    rp = [rb(1)-ro(1) , rb(2)-ro(2)];
    ph1 = atan(rp(2)/(rp(1)));
    
    deltaPhi = asin(Rb/norm(rp));
    phiMoins = ph1 - deltaPhi;
    phiPlus = ph1 + deltaPhi;

end

