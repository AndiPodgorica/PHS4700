function [Touche tf blocf ballef ]=Devoir3(bloci, ballei, tl)
    deltaT = 0.0001;
    precision = 0.001;
    mballe = 70*10^(-3);    %kg
    Rballe = 2*10^(-2);       %m
    mbloc = 0.58;
    Abloc = 6*10^(-2);
    
    %%%%%
    ttt = zeros(10000,1);
    pballe = zeros(10000,3);
    pbloc = zeros(10000,3);
    i = 0;
    %%%%%
    
    epsilon = 0.8;
    
    rballe = ballei(1,:)';
    rbloc = bloci(1,:)';
    vballe = ballei(2,:)';
    vbloc = bloci(2,:)';
    
    wbloc = bloci(3,:)';
    wballe = [0; 0; 0];
    
    qballe = [vballe; rballe];
    qbloc = [vbloc; rbloc; wbloc];
    tf = 0;
    
    [collision, stop] = verif_limites(rballe, rbloc);
    while ~stop && ~collision && tf < tl
        qbloc=SEDRK4t0(qbloc,tf,deltaT,'gbloc');
        vbloc = qbloc(1:3);
        rbloc = qbloc(4:6);
        
        tf = tf + deltaT;
        i = i + 1;
        ttt(i) = tf;
        pballe(i,:) = rballe';
        pbloc(i,:) = rbloc';
        [collision, stop] = verif_limites(rballe, rbloc);
    end
    
    while ~stop && ~collision
        qballe=SEDRK4t0(qballe,tf,deltaT,'gballe');
        vballe = qballe(1:3);
        rballe = qballe(4:6);
        
        qbloc=SEDRK4t0(qbloc,tf,deltaT,'gbloc');
        vbloc = qbloc(1:3);
        rbloc = qbloc(4:6);
        
        tf = tf + deltaT;
        i = i + 1;
        ttt(i) = tf;
        pballe(i,:) = rballe';
        pbloc(i,:) = rbloc';
        [collision, stop, n] = verif_limites(rballe, rbloc, vbloc);
    end
    
    if collision
        p = rballe + Rballe * n;
        rap = rbloc - p;
        rbp = rballe - p;

        vap = vbloc + cross(wbloc, rap);
        vbp = vballe + cross(wballe, rbp);
        vr = dot(n, (vap - vbp));

        Iballe = (2/5)*mballe*Rballe^2*eye(3,3);
        Ibloc = mbloc*(Abloc^2)/6*eye(3,3);
        Ga = dot(n, Ibloc\cross(cross(rap,n),rap));
        Gb = dot(n, Iballe\cross(cross(rbp,n),rbp));
        j = -1*(1+epsilon)*vr/(1/mbloc + 1/mballe + Ga + Gb);
        
        wbloc = wbloc + j* Ibloc\cross(rap,n);
        wballe = wballe - j* Iballe\cross(rbp,n);

        vbloc = vbloc + n*j/mbloc;
        vballe = vballe - n*j/mballe;
    end
    
    figure;
    plot3(pballe(1:i,1),pballe(1:i,2),pballe(1:i,3),'DisplayName','balle');
    hold on;
    axis equal;
    plot3(pbloc(1:i,1),pbloc(1:i,2),pbloc(1:i,3),'DisplayName','bloc');
   
  
    ballef = ballei;
    ballef(1,:) = rballe';
    ballef(2,:) = vballe';
    
    blocf = bloci;
    blocf(1,:) = rbloc';
    blocf(2,:) = vbloc';
    blocf(3,:) = wbloc';
    
    Touche = ~collision;
end
