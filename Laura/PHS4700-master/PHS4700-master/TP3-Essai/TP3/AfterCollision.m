function [vaf, vbf] = AfterCollision(collisionNormal,coinCollision, va, vb, ra, rb)
  ma = 1540;
  mb = 1010;
  La = 4.78;
  Lb = 4.23;
  la = 1.82;
  lb = 1.6;
  ha = 1.8;
  hb = 1.8;
  epsilon = 0.8;

  normal = [collisionNormal(1,1); collisionNormal(2,1); 0];
  coin = [coinCollision(1,1); coinCollision(2,1); 0];
  
  rap = coin - [ra(1); ra(2); 0];
  rbp = coin - [rb(1); rb(2); 0];

  Ia = InertieCm(ma, La, la, ha);
  Ib = InertieCm(mb, Lb, lb, hb);

  ua = rap(1, 1)* normal(1, 1) - rap(2, 1)* normal(2, 1);
  ub = rbp(1, 1)* normal(1, 1) - rbp(2, 1)* normal(2, 1);

  Ga = (ua^2)/Ia(3,3); 
  Gb = (ub^2)/Ib(3,3);

  alpha = 1/((1/ma)+(1/mb)+Ga+Gb);
  
  vap = [va(1) va(2) 0] + cross([0 0 va(3)], rap);
  vbp = [vb(1) vb(2) 0] + cross([0 0 vb(3)], rbp);
  
  
  vrNeg = dot(normal, (vap-vbp));

  j = -alpha*(1+epsilon)*vrNeg;

  vitesseA = [va(1); va(2); 0] + (j/ma)*normal;
  vitesseB = [vb(1); vb(2); 0] - (j/mb)*normal;

  vaf = [vitesseA(1, 1) vitesseA(2, 1) 0];
  vbf = [vitesseB(1, 1) vitesseB(2, 1) 0];

  omega_a_f = [0  0 va(3)] + j*([0 0 ua]/Ia(3,3));
  omega_b_f = [0  0 vb(3)] + j*([0 0 ub]/Ib(3,3));

  vaf(3) = omega_a_f(3);
  vbf(3) = omega_b_f(3);
end