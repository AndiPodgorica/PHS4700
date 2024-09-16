clear;
clc;
clf;
close all;

disp('TP2');

i = 1;

% Cas 1
disp('---- ESSAI 1 ----');
title('Essai 1');
for i = 1:3
    fprintf('---- OPTION %d ----\n', i);
    [coup, tf, rbf, vbf] = Devoir2(i, [0; 0.5; 1.1], [4; 0; 0.8], [0; -70; 0]);
    print(coup, tf, rbf, vbf);
end
afficherLegende();
savefig('essai1.fig');
saveas(gcf, 'essai1.jpg');
disp('==========');
fprintf('\n');

% Cas 2
figure;
disp('---- ESSAI 2 ----');
title('Essai 2');
for i = 1:3
    fprintf('---- OPTION %d ----\n', i);
    [coup, tf, rbf, vbf] = Devoir2(i, [0; 0.4; 1.14], [10; 1; 0.2], [0; 100; -50]);
    print(coup, tf, rbf, vbf);
end
afficherLegende();
savefig('essai2.fig');
saveas(gcf, 'essai2.jpg');
disp('==========');
fprintf('\n'); 

% Cas 3
figure;
disp('---- ESSAI 3 ----');
title('Essai 3');
for i = 1:3
    fprintf('---- OPTION %d ----\n', i);
    [coup, tf, rbf, vbf] = Devoir2(i, [2.74; 0.5; 1.14], [-5; 0; 0.2], [0; 100; 0]);
    print(coup, tf, rbf, vbf);
end
afficherLegende();
savefig('essai3.fig');
saveas(gcf, 'essai3.jpg');
disp('==========');
fprintf('\n'); 

% Cas 4
figure;
disp('---- ESSAI 4 ----');
title('Essai 4');
for i = 1:3
    fprintf('---- OPTION %d ----\n', i);
    [coup, tf, rbf, vbf] = Devoir2(i, [0; 0.3; 1], [10; -2; 0.2], [0; 10; -100]);
    print(coup, tf, rbf, vbf);
end
afficherLegende();
savefig('essai4.fig');
saveas(gcf, 'essai4.jpg');
disp('==========');
fprintf('\n'); 


function print(coup, tf, rbf, vbf)
    fprintf('Coup = %d\n', coup);
    fprintf('Temps = %d\n', tf);
    disp('Position = ');
    disp(rbf);
    disp('Vitesse = ');
    disp(vbf);
end


function afficherLegende()
    h = findobj(gca, 'Type', 'line');
    legend([h(3) h(2) h(1)], 'Option 1', 'Option 2', 'Option 3');
end

