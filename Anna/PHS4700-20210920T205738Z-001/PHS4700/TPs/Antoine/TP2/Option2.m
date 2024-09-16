function [ output ] = Option2( vi, Balle, cnt, sortie)
    pas = 0.01;
    p = SEDRK4([pas, [vi(1) vi(2) vi(3) Balle.Position]], pas, 'g2', Balle);
    Balle.Position = [p(5) p(6) p(7)];

    sortie.Add(p(5),p(6),p(7),pas * cnt);
    
    output = sortie;
    if (p(5) > 0)
        Option1([p(2) p(3) p(4)], Balle, cnt+1, sortie);
    else
        disp(p)
        output = sortie;
    end
end

