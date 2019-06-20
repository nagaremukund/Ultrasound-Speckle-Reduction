% a function to calculate normalized PSNR for images x and xr
%
% Ramin Eslami 6-1-05

function psnr = psnr2(x, xr)

Max = 255;
N = prod(size(x));
e = x(:)-xr(:);
% mse = sum(sum((e/Max).^2))/N;
psnr = 10*log10( Max^2 / ( sum(e.^2) / N ) );