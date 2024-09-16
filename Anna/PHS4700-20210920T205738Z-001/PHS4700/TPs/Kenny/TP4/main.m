clear;
clc;
clf;
close all;

disp('Devoir 4');

%Cas 1
nout = 1;
nin  = 1;
poso = [0, 0, 5];
[xi, yi, zi, face] = Devoir4(nout, nin, poso);
%saveas(gcf, 'images/figure1.bmp');

%Cas 2
nout = 1;
nin  = 1.5;
poso = [0, 0, 5];
[xi, yi, zi, face] = Devoir4(nout, nin, poso);
%saveas(gcf, 'images/figure2.bmp');

%Cas 3
nout = 1;
nin  = 1.5;
poso = [0, 0, 0];
[xi, yi, zi, face] = Devoir4(nout, nin, poso);
%saveas(gcf, 'images/figure3.bmp');

%Cas 4
nout = 1.2;
nin  = 1;
poso = [0, 0, 5];
[xi, yi, zi, face] = Devoir4(nout, nin, poso);
%saveas(gcf, 'images/figure4.bmp');

disp('Finito');
