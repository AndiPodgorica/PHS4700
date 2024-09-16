function [ output, prise ] = Simulation( fn, vi, Balle, cnt, sortie, zone)
    prise = 0;
    pas = 0.01;
    p = SEDRK4([pas, [vi(1) vi(2) vi(3) Balle.Position]], pas, fn, Balle);
    Balle.Position = [p(5) p(6) p(7)];

    sortie.Add(p(5),p(6),p(7),pas * cnt, p(2), p(3), p(4));
    
    output = sortie;
    if (p(5) > 0)
         [output, prise] = Simulation(fn, [p(2) p(3) p(4)], Balle, cnt+1, sortie, zone);
    else
        vec = [
            sortie.x(end) - sortie.x(end-1) 
            sortie.y(end) - sortie.y(end-1) 
            sortie.z(end) - sortie.z(end-1) 
        ];
        
        t = -sortie.x(end-1) / vec(1); 
        pointY = sortie.y(end-1) + vec(2)*t;
        pointZ = sortie.z(end-1) + vec(3) *t; 
        
        if ( pointY >= zone.Points(2,1)&& pointY <= zone.Points(2,2) && pointZ <= zone.Points(3,1) && pointZ >= zone.Points(3,3))
            prise = 1;
        else if p(7) > 0
             [sortie, prise] = Simulation(fn, [p(2) p(3) p(4)], Balle, cnt+1, sortie, zone);
        end
        %disp(p)
        output = sortie;
    end
end

