for vit=1:3
    if vit == 1
      xy0=[10; 10];                     % m
      vb0=[26.5686; 13.93232;16.25714]; % m/s
      wb0=[0;-45;0];                   % rad/s
    elseif vit == 2
      xy0=[10; 10];                     % m
      vb0=[26; 16;18.9935]; % m/s
      wb0=[0;0;-87.55];                    % rad/s
    elseif vit == 3
      xy0=[2; 60];                     % m
      vb0=[25; -5; 21]; % m/s
      wb0=[-30; -30; -60];                    % rad/s
    end;
  %
  %  Tracer terrain et position de la balle de golf 
  %
    fprintf('\nSimulation %3d\n',vit);
  
    for option=1:3
      if option == 1
        fprintf('Acceleration gravitationnelle seulement \n');
        type='r-';
      elseif option == 2
        fprintf('Acceleration gravitationnelle et force visqueuse \n');
        type='b-';
      elseif option == 3
        fprintf('Acceleration gravitationnelle, force visqueuse et force de Magnus\n');
        type='k-';
      end;
      fprintf('Position initiale de la balle [%12.8f %12.8f]  m \n',xy0(1),xy0(2));
      fprintf('Vitesse initiale de la balle  [%12.8f %12.8f %12.8f]  m/s \n',vb0(1),vb0(2),vb0(3));
      fprintf('Vitesse angulaire de la balle [%12.8f %12.8f %12.8f] rad/s \n',wb0(1),wb0(2),wb0(3));
      [coup, vf, t, rbt ]=Devoir2(option,xy0,vb0,wb0);
      fprintf('\nCoup %3d \n',coup);
      fprintf('\nLa simualtion se termine au temps %12.8f s \n',t);
      if coup == 0
        fprintf('Le golfeur a un trou d''un coup \n');
      elseif coup == 1
        fprintf('Le balle demeure sur le terrain et atteint le vert\n');
      elseif coup == 2
        fprintf('Le balle demeure sur le terrain sans atteindre le vert\n');
      elseif coup == 3
        fprintf('Le balle sort du terrain \n');
      end
      fprintf('Vitesse finale de la balle     [%12.8f %12.8f %12.8f]  m/s\n',vf(1),vf(2),vf(3));
      fprintf('Position finale de la balle    [%12.8f %12.8f %12.8f]  m \n',rbt(1),rbt(2),rbt(3));
      fprintf('\n\n');
    end
    pause;
  end