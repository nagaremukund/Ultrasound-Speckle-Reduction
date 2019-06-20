% circular-shifts an image with i in rows and j in columns
%
% Ramin Eslami 6-1-05

function xs = circularshift(x, i, j)

[m, n] = size(x);
xs = wrapadjust(x, [mod(i, m), mod(j, n)]);