clf;

hold on
grid on
axis([-1 15 -1 1 0 5]);
view([0, -90, 0])

ln = line(balle.CentreDeMasse(1,1:end), balle.CentreDeMasse(2,1:end), balle.CentreDeMasse(3,1:end));
set(ln, 'LineStyle', '-');
set(ln, 'DisplayName', 'Simulation 1');

ln = line(boite.CentreDeMasse(1,1:end), boite.CentreDeMasse(2,1:end), boite.CentreDeMasse(3,1:end));
set(ln, 'LineStyle', 'x');
set(ln, 'Color', 'r');
set(ln, 'DisplayName', 'Simulation 1');

% sbo = size(boite.CentreDeMasse);
% sba = size(balle.CentreDeMasse);
% j = 1;
% i = 1;
% draw = false;
% stop = max(sbo(2), sba(2));
% while i < stop
%     if i <= sbo(2)
%         scatter3(boite.CentreDeMasse(1,i), boite.CentreDeMasse(2,i), boite.CentreDeMasse(3,i), '.r'); 
%     end
%     
%     if draw || boite.t(i) >= balle.t(1)
%         if draw == false
%             stop = stop + i;
%             draw = true;
%         end
%         
%         if j <= sba(2)
%             scatter3(balle.CentreDeMasse(1,j), balle.CentreDeMasse(2,j), balle.CentreDeMasse(3,j), '.b'); 
%             j = j + 1;
%         end
%     end
%     i = i+1;
%    % pause(0.001);
% end



title('Trajectoire des objets');
xlabel('Axe des X');
ylabel('Axe des Y');
zlabel('Axe des Z');

hold off