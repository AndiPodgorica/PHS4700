function [ output ] = Simulation( fn, balle, cnt, sortie, pas)
    p = SEDRK4([pas, [balle.V(1:3,end)' balle.CentreDeMasse(1:3,end)']], pas, fn, balle);
    balle.CentreDeMasse = [ balle.CentreDeMasse p(5:7)'];
    balle.V = [ balle.V p(2:4)' ];
end

