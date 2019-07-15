% cyclic-shifts an image
%
% Ramin Eslami 6-1-05

function xa = wrapadjust(x, N)
N1 = N(1); N2 = N(2);

xa = zeros(size(x));

xa(1:end-N1,1:end-N2) = x(N1+1:end, N2+1:end);

xa(end-N1+1:end, 1:end-N2) = x(1:N1, N2+1:end);

xa(1:end-N1, end-N2+1:end) = x(N1+1:end, 1:N2);

xa(end-N1+1:end, end-N2+1:end) = x(1:N1, 1:N2);