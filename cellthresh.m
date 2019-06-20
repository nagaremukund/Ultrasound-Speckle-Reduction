% A function to threshold the elements of a cell (z) with th
% N is the number of elements that are not thresholded
%
% Ramin Eslami 2005

function [zt, N] = cellthresh(z, th)

zt = z;
N = 0;

if iscell(z)
    for i = 1:length(z)
        [zt{i}, n] = cellthresh(z{i}, th);
        N = N + n;
    end

else
%     ind = find(abs(z) < th);
%     N = length(z(:)) - length(ind);
%     zt(ind) = 0;
    
    
%     Soft Thresholding

z1 = abs(z);
ind = find(sign(z).*(z1 < th).*(z1 - th) );
 N = length(z(:)) - length(ind);
zt(ind) = 0;
    
end