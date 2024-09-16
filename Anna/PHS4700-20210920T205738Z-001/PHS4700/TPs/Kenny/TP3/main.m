clear;
clc;
clf;
close all;

disp('Devoir 3');

% Tir 1
figure;
[Coll, tf, raf, vaf, rbf, vbf] = Devoir3([0 0], [20 0 2], [100 100], [0 -20 -1], 0.0);
%printConditionsInitiales([0 0], [20 0 2], [100 100], [0 -20 -1], 0.0, 1);
print(Coll, tf, raf, vaf, rbf, vbf, 1);

% Tir 2
figure;
[Coll, tf, raf, vaf, rbf, vbf] = Devoir3([0 0], [30 0 2], [100 100], [0 -30 -1], 0.0);
%printConditionsInitiales([0 0], [30 0 2], [100 100], [0 -30 -1], 0.0, 2);
print(Coll, tf, raf, vaf, rbf, vbf, 2);

%Tir 3
figure;
[Coll, tf, raf, vaf, rbf, vbf] = Devoir3([0 0], [20 0 2], [100 50], [0 -10 0], 1.6);
%printConditionsInitiales([0 0], [20 0 2], [100 50], [0 -10 0], 1.6, 3);
print(Coll, tf, raf, vaf, rbf, vbf, 3);

% Tir 4
figure;
[Coll, tf, raf, vaf, rbf, vbf] = Devoir3([0 0], [10 10 1], [25 10], [10 0 0], 0.0);
%printConditionsInitiales([0 0], [10 10 1], [25 10], [10 0 0], 0.0, 4);
print(Coll, tf, raf, vaf, rbf, vbf, 4);

%Tir 5
figure;
[Coll, tf, raf, vaf, rbf, vbf] = Devoir3([0 0], [20 0 2], [100 50], [0 -10 0], 0.0);
%printConditionsInitiales([0 0], [20 0 2], [100 50], [0 -10 0], 0.0, 5);
print(Coll, tf, raf, vaf, rbf, vbf, 5);

%Tir 6
figure;
[Coll, tf, raf, vaf, rbf, vbf] = Devoir3([0 0], [20 2 2], [100 10], [10 0 5], 1.0);
%printConditionsInitiales([0 0], [20 2 2], [100 10], [10 0 5], 1.0, 6);
print(Coll, tf, raf, vaf, rbf, vbf, 6);

% function printConditionsInitiales(rai, vai, rbi, vbi, tb, i)
%     affichage = ['-----TIR ', num2str(i), '------'];
%     disp(affichage);
%     disp('conditions initiales :');
%     fprintf('PositionA = [%6.2f   %6.2f]\n', rai(1), rai(2));
%     fprintf('VitesseA  = [%6.2f   %6.2f   %6.2f]\n', vai(1), vai(2), vai(3));
%     
%     fprintf('PositionB = [%6.2f   %6.2f]\n', rbi(1), rbi(2));
%     fprintf('VitesseB  = [%6.2f   %6.2f   %6.2f]\n', vbi(1), vbi(2), vbi(3));
%     fprintf('tb = [%6.2f]\n', tb);
%     
%     fprintf('\n');
%     disp('-----conditions finales :------');
% end

function print(Coll, tf, raf, vaf, rbf, vbf, i)
    affichage = ['-----TIR ', num2str(i), '------'];
    disp(affichage);
    fprintf('Collision = %s\n', stringCollision(Coll));
    fprintf('Temps = %.2f\n', tf);
    
    fprintf('PositionA = [%6.2f   %6.2f   %6.2f]\n', raf(1), raf(2), raf(3));
    fprintf('VitesseA  = [%6.2f   %6.2f   %6.2f]\n', vaf(1), vaf(2), vaf(3));
    
    fprintf('PositionB = [%6.2f   %6.2f   %6.2f]\n', rbf(1), rbf(2), rbf(3));
    fprintf('VitesseB  = [%6.2f   %6.2f   %6.2f]\n', vbf(1), vbf(2), vbf(3));
    
    disp('-----');
    fprintf('\n');
end

function str = stringCollision(coll)
    if (coll == 1)
        str = '1 (Faux)';
    else
        str = '0 (Vrai)';
    end
end