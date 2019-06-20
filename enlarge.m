%
% Ramin Eslami 6-1-05

function [x, M, flag] = enlarge(x, s)

[N, N] = size(x);

flag = 0; M = N;

if N < s  
    x = [x x; x x]; M = 2*N; flag = 1;
end
if N < s/2
    x = [x x; x x]; M = 4*N; flag = 2;
end
if N < s/4
    x = [x x; x x]; M = 8*N; flag = 3;
end
