function [ output_args ] = outputBmp( x, y, data )
%OUTPUTBMP Summary of this function goes here
%   Detailed explanation goes here
file = fopen('out.bmp', 'w');

BM = [ hex2dec('42') hex2dec('4D')];
size = x * y + hex2dec('436');
reserved = [ 0 0 0 0 ];
offset = [ hex2dec('36') hex2dec('04') 0 0 ];
dibsize = [hex2dec('28') 0 0 0];
x;
y;
nplanes = [1 0];
colors256_8bits = [ 8 0 ];
compression = [0 0 0 0];
imgSize = x * y;
unused = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ];

h = fopen('header.bin');
hbytes = fread(h);
fclose(h);


fwrite(file, BM);
fwrite(file, size, 'integer*4');
fwrite(file, reserved);
fwrite(file, offset);
fwrite(file, dibsize);
fwrite(file, x, 'integer*4');
fwrite(file, y, 'integer*4');
fwrite(file, nplanes);
fwrite(file, colors256_8bits);
fwrite(file, compression);
fwrite(file, imgSize, 'integer*4');
fwrite(file, unused);
fwrite(file, hbytes);
fwrite(file, data);

fclose(file);

end

