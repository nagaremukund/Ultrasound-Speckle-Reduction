function [ xr ] = idfb2s_rec(Y2, outputmode )
%IDFB2S_REC Summary of this function goes here
%   Detailed explanation goes here
if nargin < 2, outputmode = 0; end

load('filters_D_F2.mat');
if outputmode
    
    y0 = qupz(Y2{1},2);
    y1 = qupz(Y2{2},2);
    y2 = qupz(Y2{3},2);
    y3 = qupz(Y2{4},2);
    
else

    [N, N] = size(Y2);
    P = N/2;

    y0 = Y2(:,:,1);
    y1 = Y2(:,:,2);
    y2 = Y2(:,:,3);
    y3 = Y2(:,:,4);

end

%y0u = upsample2(y0);
%y1u = upsample2(y1);
%y2u = upsample2(y2);
%y3u = upsample2(y3);

[N, N] = size(y0);
M = N;

[y0, M, flag] = enlarge(y0, 64);
[y1, M, flag] = enlarge(y1, 64);
[y2, M, flag] = enlarge(y2, 64);
[y3, M, flag] = enlarge(y3, 64);

G0_D = sqrt(2)*fft2(G0_D, M, M);
G1_D = sqrt(2)*fft2(G1_D, M, M);
G0_F = sqrt(2)*fft2(G0_F, M, M);
G1_F = sqrt(2)*fft2(G1_F, M, M);

y0u = real( ifft2( fft2(y0,M,M).*G0_F ) );
 y0u = wrapadjust(y0u, [35 35]);

y1u = real( ifft2( fft2(y1,M,M).*G1_F ) );
 y1u = wrapadjust(y1u, [11 11]);

y1=0.5*(y0u + y1u);

y2u = real( ifft2( fft2(y2,M,M).*G0_F ) );
 y2u = wrapadjust(y2u, [35 35]);

y3u = real( ifft2( fft2(y3,M,M).*G1_F ) );
 y3u = wrapadjust(y3u, [11 11]);
y2=0.5*( y2u + y3u);

if flag
   y0u = y0u(1:N, 1:N);
   y1u = y1u(1:N, 1:N);
   y2u = y2u(1:N, 1:N);
   y3u = y3u(1:N, 1:N);
end
xr = idfb1s_rec({y1, y2}, 1);

end

