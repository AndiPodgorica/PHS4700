function [thetaN, phiM] = EchantillonAngle(rangeVertical, rangeHorizontal, N, M, n, m)
    thetaMin = rangeVertical(1);
    thetaMax = rangeVertical(2);    
    phiMin = rangeHorizontal(1);
    phiMax = rangeHorizontal(2);
    
    thetaN = thetaMin + ( ( (thetaMax - thetaMin) / (2 * N) ) * (2 * n - 1) );
    phiM = phiMin + ( ( (phiMax - phiMin) / (2 * M) ) * (2 * m - 1) );
end