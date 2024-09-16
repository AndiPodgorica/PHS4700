function [ Dev vbaf vbof rba rbo tc ] = Devoir3( wboitei, vballei, tballe)

Declarations();

boite.V = [0 0 0]';
boite.W = wboitei;

balle.V = vballei; 
tballe = tballe;

step = 0.00005; % Because.

t = 0;
dRot = boite.W * step;

cont = true;

while cont
    t = t + step;
    % MOVE THE BALL
    if t >= tballe
        balle.t = [ balle.t t ];
        Simulation('calculBalle', balle, 0, 0, step);
    end
    
    if boite.CentreDeMasse(3,end) > 0
        boite.t = [ boite.t t ];
        Simulation('calculBoite', boite, 0, 0, step);
        nrot = boite.Rot(1:3,end) + dRot;
        boite.Rot = [ boite.Rot nrot ];
    end
    
    [col pCol] = CollisionBalleCylindre(balle,boite);
    if(col)
        cont = false;
        t_collision = t;
        cdmBa = boite.CentreDeMasse(1:3,end)';
        cdmBo = balle.CentreDeMasse(1:3,end)';
        
        disp('Temps de collision: ')
        disp(t_collision)        
        disp('Point de collision: ')
        disp(pCol)        
        disp('Centre de masse de la balle: ')
        disp(cdmBa')
        disp('Centre de masse de la boite: ')
        disp(cdmBo')
        
        [vBalle vBoite ] = VitessesCollision( balle, boite, pCol);
        
        
        disp('Vitesse de la balle avant impact: ')
        disp(vBalle(:,1)')
        disp('Vitesse de la balle apres impact: ')
        disp(vBalle(:,3)')
        disp('Vitesse angulaire de la balle avant impact: ')
        disp(vBalle(:,2)')
        disp('Vitesse angulaire de la balle apres impact: ')
        disp(vBalle(:,4)')
        
        disp('Vitesse de la boite avant impact: ')
        disp(vBoite(:,1)')
        disp('Vitesse de la boite apres impact: ')
        disp(vBoite(:,3)')
        disp('Vitesse angulaire de la boite avant impact: ')
        disp(vBoite(:,2)')
        disp('Vitesse angulaire de la boite apres impact: ')
        disp(vBoite(:,4)')
        
        disp('point de collision - balle.cdm');
        disp(pCol' - balle.CentreDeMasse(1:3,end)');
        
        disp('Distance entre balle.cdm et pCol');
        disp(norm(pCol - balle.CentreDeMasse(1:3,end)));
        
        disp('Erreur (mm)');
        disp((0.0335 - norm(pCol - balle.CentreDeMasse(1:3,end)))*1000);
    end
    
    if balle.CentreDeMasse(3,end) - balle.Rayon <= 0
        cont = false;
    end
    
end

%PlotBall();
Dev = col;
vbaf = [ vBalle(:,1)' vBalle(:,3)' ; vBalle(:,2)' vBalle(:,4)' ];
vbof = [ vBoite(:,1)' vBoite(:,3)' ; vBoite(:,2)' vBoite(:,4)' ];
rba = balle.CentreDeMasse;
rbo = boite.CentreDeMasse;
tc = boite.t;

end

