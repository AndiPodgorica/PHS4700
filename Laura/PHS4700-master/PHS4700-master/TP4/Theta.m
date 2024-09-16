function [thetaMoins, thetaPlus] = Theta(ro)
    Rb = 2;
    rb=[4, 4, 11];
    h = 18;

    rbo = [rb(1)-ro(1) , rb(2)-ro(2)];
    r1 = [(norm(rbo) - Rb),  (rb(3) - h/2 - ro(3))];
    r2 = [(norm(rbo) + Rb),  (rb(3) - h/2 - ro(3))];

    r3 = [(norm(rbo) - Rb),  (rb(3) + h/2 - ro(3))];
    r4 = [(norm(rbo) + Rb),  (rb(3) + h/2 - ro(3))];

    r = [acos(r1(2)/norm(r1)), acos(r2(2)/norm(r2)), acos(r3(2)/norm(r3)), acos(r4(2)/norm(r4))];
    thetaMoins = min(r);
    thetaPlus = max(r);
end