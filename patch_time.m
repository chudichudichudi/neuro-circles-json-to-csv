% Converts format x, y, width, size to X, Y required by patch

function [X,Y]=patch_time(dat);

X=[dat(1),dat(1)+dat(3),dat(1)+dat(3),dat(1)];
Y=[dat(2),dat(2),dat(2)+dat(4),dat(2)+dat(4)];