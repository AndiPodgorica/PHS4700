clear;  %clear la mémoire
clc;    %clear le texte de la console
clf;

% --------------- INITIALISATION ---------------
disp('TP2')

definitions();

Calculs.gravite(Balle);


hold on
axis([-10 20 -1 1 0 3]);

%zonePrise
pointA = zonePrise.Points(:,1);
pointB = zonePrise.Points(:,2);
pointD = zonePrise.Points(:,3);
pointC = zonePrise.Points(:,4);
points=[pointA pointB pointC pointD]; % using the data given in the question
fill = fill3(points(1,:), points(2,:) ,points(3,:),'r');
set(fill, 'DisplayName', 'zonePrise de prise');
alpha(0.3)

%sim1
disp('--------------------------------------------------')
disp('Simulation 1')
s1 = Sortie();
[result, prise] = Simulation('g1', Vi1, Balles(1), 0, s1, zonePrise);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '-');
set(ln, 'DisplayName', 'Simulation 1');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))
disp('Vitesse finale')
vf = sprintf('%.2f,' , [result.vx(end) result.vy(end) result.vz(end)]);
vf = vf(1:end-1);
disp(strcat('(', vf, ')'''))

%sim2
disp('--------------------------------------------------')
disp('Simulation 2')
s = Sortie();
[result, prise] = Simulation('g1', Vi2, Balles(2), 0, s, zonePrise);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '--');
set(ln, 'DisplayName', 'Simulation 1');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))
disp('Vitesse finale')
vf = sprintf('%.2f,' , [result.vx(end) result.vy(end) result.vz(end)]);
vf = vf(1:end-1);
disp(strcat('(', vf, ')'''))

%sim3
disp('--------------------------------------------------')
disp('Simulation 3')
s = Sortie();
[result, prise] = Simulation('g1', Vi3, Balles(3), 0, s, zonePrise);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '.');
set(ln, 'DisplayName', 'Simulation 3');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))
disp('Vitesse finale')
vf = sprintf('%.2f,' , [result.vx(end) result.vy(end) result.vz(end)]);
vf = vf(1:end-1);
disp(strcat('(', vf, ')'''))

%sim4
disp('--------------------------------------------------')
disp('Simulation 4')
s1 = Sortie();
[result, prise] = Simulation('g2', Vi1, Balles(4), 0, s1, zonePrise);
ln = line(result.x, result.y, result.z);
set(ln, 'Color', 'r');
set(ln, 'LineStyle', '-');
set(ln, 'DisplayName', 'Simulation 4');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))
disp('Vitesse finale')
vf = sprintf('%.2f,' , [result.vx(end) result.vy(end) result.vz(end)]);
vf = vf(1:end-1);
disp(strcat('(', vf, ')'''))

%sim5
disp('--------------------------------------------------')
disp('Simulation 5')
s = Sortie();
[result, prise] = Simulation('g2', Vi2, Balles(5), 0, s, zonePrise);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '--');
set(ln, 'DisplayName', 'Simulation 5');
set(ln, 'Color', 'r');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))
disp('Vitesse finale')
vf = sprintf('%.2f,' , [result.vx(end) result.vy(end) result.vz(end)]);
vf = vf(1:end-1);
disp(strcat('(', vf, ')'''))

%sim6
disp('--------------------------------------------------')
disp('Simulation 6')
s = Sortie();
[result, prise] = Simulation('g2', Vi3, Balles(6), 0, s, zonePrise);
ln = line(result.x, result.y, result.z);
set(ln, 'Color', 'r');
set(ln, 'LineStyle', '.');
set(ln, 'DisplayName', 'Simulation 6');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))
disp('Vitesse finale')
vf = sprintf('%.2f,' , [result.vx(end) result.vy(end) result.vz(end)]);
vf = vf(1:end-1);
disp(strcat('(', vf, ')'''))

%sim7
disp('--------------------------------------------------')
disp('Simulation 7')
s1 = Sortie();
[result, prise] = Simulation('g3', Vi1, Balles(7), 0, s1, zonePrise);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '-');
set(ln, 'DisplayName', 'Simulation 7');
set(ln, 'Color', 'g');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))
disp('Vitesse finale')
vf = sprintf('%.2f,' , [result.vx(end) result.vy(end) result.vz(end)]);
vf = vf(1:end-1);
disp(strcat('(', vf, ')'''))

%sim8
disp('--------------------------------------------------')
disp('Simulation 8')
s = Sortie();
[result, prise] = Simulation('g3', Vi2, Balles(8), 0, s, zonePrise);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '--');
set(ln, 'DisplayName', 'Simulation 8');
set(ln, 'Color', 'g');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))
disp('Vitesse finale')
vf = sprintf('%.2f,' , [result.vx(end) result.vy(end) result.vz(end)]);
vf = vf(1:end-1);
disp(strcat('(', vf, ')'''))

%sim9
disp('--------------------------------------------------')
disp('Simulation 9')
s = Sortie();
[result, prise] = Simulation('g3', Vi3, Balles(9), 0, s, zonePrise);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '.');
set(ln, 'DisplayName', 'Simulation 9');
set(ln, 'Color', 'g');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))
disp('Vitesse finale')
vf = sprintf('%.2f,' , [result.vx(end) result.vy(end) result.vz(end)]);
vf = vf(1:end-1);
disp(strcat('(', vf, ')'''))


grid on
hold off


title('Trajectoire des balles');
xlabel('Axe des X');
ylabel('Axe des Y');
zlabel('Axe des Z');
