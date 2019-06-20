function [ xr ] = idfb1s_rec( Y1, outputmode )
%IDFB1S_REC Summary of this function goes here
%   Detailed explanation goes here
% the integrated inverse TIDFB function needs cell input
% DFBtype = 'r' for regular, 'h' for horizantal, and 'v' for vertical
if nargin < 2, outputmode = 0; end

load('filters_D_F2.mat');

% Q0U*Q1U=1/2*I
if outputmode
    
    y0 = qupz(Y1{1},2);
    y1 = qupz(Y1{2},2);
 
    
else
    [N, N] = size(Y1);
    P = N/2;

    y0 = qupz(Y1(:,:,1),1);
    y1 = qupz(Y1(:,:,2),1);
   
 end

%y0u = upsample2(y0);
%y1u = upsample2(y1);
%y2u = upsample2(y2);
%y3u = upsample2(y3);

[N, N] = size(y0);
M = N;

[y0, M, flag] = enlarge(y0, 64);
[y1, M, flag] = enlarge(y1, 64);


G0_F = sqrt(2)*fft2(G0_F, M, M);
G1_F = sqrt(2)*fft2(G1_F, M, M);


y0u = real( ifft2( fft2(y0,M,M).*G0_F) );
y0u = wrapadjust(y0u, [35 35]);

y1u = real( ifft2( fft2(y1,M,M).*G1_F) );
y1u = wrapadjust(y1u, [11 11]);

if flag
   y0u = y0u(1:N, 1:N);
   y1u = y1u(1:N, 1:N);
  
end

xr = 1/2*(y0u + y1u); % 


