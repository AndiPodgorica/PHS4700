function [ droite ] = ExtractDroite( vector )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    droite = Droite([vector(1),vector(2),vector(3)]', [vector(4),vector(5),vector(6)]');
end

