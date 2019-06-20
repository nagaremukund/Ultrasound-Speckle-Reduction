% the scaled version (actually the original)
% TIDFB function 7-15-2004 (without downsampling)
% outputmode = 1 : cell array output
% modified 4-8-05 shifts are adjusted
%
% Ramin Eslami

function Y1 = dfb1s_dec(x, outputmode)

if nargin < 2, outputmode = 0; end

%load qfb2
load('filters_D_F2.mat');
[N, N] = size(x);
M = N;

[x, M, flag] = enlarge(x, 64);

H0_F = sqrt(2)*fft2(H0_F, M, M);
H1_F = sqrt(2)*fft2(H1_F, M, M);
% H0_F = sqrt(2)*fft2(H0_F, M, M);
% H1_F = sqrt(2)*fft2(H1_F, M, M);
X = fft2(x, M, M);

x0 = real( ifft2( X.*H0_F) );
x0 = wrapadjust(x0, [11 11]);

x1 = real( ifft2( X.*H1_F ) );
x1 = wrapadjust(x1, [35 35]);

% x2 = real( ifft2( X.*H1_f.*h0q_f ) );
% x2 = wrapadjust(x2, [33 33]);
% 
% x3 = real( ifft2( X.*H1_f.*h1q_f ) );
% x3 = wrapadjust(x3, [44 44]);

if flag
   x0 = x0(1:N, 1:N);
   x1 = x1(1:N, 1:N);
%    x2 = x2(1:N, 1:N);
%    x3 = x3(1:N, 1:N);
end

% Q0D*Q1D=2*I
%y0 = downsample2(x0);    
%y1 = downsample2(x1);
%y2 = downsample2(x2);
%y3 = downsample2(x3);

if outputmode
    
    Y1 = {msample(x0,1), msample(x1,1)};
    
else
    
    Y1(:,:,1) = msample(x0,1);
    Y1(:,:,2) = msample(x1,1);  
end