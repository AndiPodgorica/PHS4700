function [vaf, vbf] = PostCollision(raf, vaf, rbf, vbf, collisionVector, auto)
% raf est la position du centre de massse des auto respective
% vai vitesse des auto respective 
    epsilon = 0.8;
    masseA = 1540;
    masseB = 1010;
    
    coinsCollision = collisionVector(1,:);
    normale = collisionVector(2,:);
    rap = [coinsCollision, 0] - [raf(1), raf(2), 0];
    rbp = [coinsCollision, 0] - [rbf(1), rbf(2), 0];
    
    vap = [vaf(1), vaf(2), 0] + cross([0, 0, vaf(3)], rap);
    vbp = [vaf(1), vaf(2), 0] + cross([0, 0, vbf(3)], rbp);
    
    vr = dot([normale, 0], (vap-vbp));
    
    % Moment inertie 
    inertieA = Inertia(masseA, 4.78, 1.8, 1.82);
	inertieB = Inertia(masseB, 4.23, 1.8, 1.6);
	inertieA = inertieA(1);
	inertieB = inertieB(1);
    
    Ga = dot([normale, 0], cross((1/inertieA)*(cross(rap, [normale 0])), rap));
    Gb = dot([normale, 0], cross((1/inertieB)*(cross(rbp, [normale 0])), rbp));
    alpha = 1/((1/masseA) + (1/masseB) + Ga + Gb);
    
    j= -alpha*(1+epsilon) *vr ;
    
    omegaAf = vaf(3) + j* 1/inertieA * transpose(cross(rap, [normale 0]));
    omegaBf = vbf(3) + j* 1/inertieB * transpose(cross(rbp, [normale 0]));
    
    if auto == 1 % B entre dans A
        vaf = [vaf(1) vaf(2)] + normale * j/masseA;
        vbf = [vbf(1) vbf(2)] - normale * j/masseB;
    else % A entre dans B
        vaf = [vaf(1) vaf(2)] - normale * j/masseA;
        vbf = [vbf(1) vbf(2)] + normale * j/masseB;
    end
    
    vaf = [vaf omegaAf(3)];
    vbf = [vbf omegaBf(3)];
end