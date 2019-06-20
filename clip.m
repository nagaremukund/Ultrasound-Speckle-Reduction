% clip the image result of processing
%
% Ramin Eslami 6-1-05

function x = clip(x, min, max)

if nargin < 2, min = 0; max = 255; end

x(x<min)=min;
x(x>max)=max;