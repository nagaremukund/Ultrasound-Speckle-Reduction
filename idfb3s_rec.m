function [ xr ] = idfb3s_rec( Y3, outputmode )
%IDFB3S_REC Summary of this function goes here
%   Detailed explanation goes here

if nargin < 2, outputmode = 0; end

load('filters_D_F3.mat');
if outputmode
    
    N = length(Y3{1});
    
    y00 = qupz(Y3{1},2);
    y01 = qupz(Y3{2},2);
    y10 = qupz(Y3{3},2);
    y11 = qupz(Y3{4},2);
    y22 = qupz(Y3{5},2);
    y23 = qupz(Y3{6},2);
    y32 = qupz(Y3{7},2);
    y33 = qupz(Y3{8},2);
else

   [N, N] = size(Y3(:,:,1));
   

   y00 = Y3(:,:,1);
   y01 = Y3(:,:,2);
   y10 = Y3(:,:,3);
   y11 = Y3(:,:,4);
   
   y22 = Y3(:,:,5);
   y23 = Y3(:,:,6);
   y32 = Y3(:,:,7);
   y33 = Y3(:,:,8);

end

M1=N;
% Type 0
%y00 = upsample(y00',2);
%y01 = upsample(y01',2);
%y00=y00';
%y01=y01';
% uf00 = sqrt(2)*upsample2(f00);
% uf01 = sqrt(2)*upsample2(f01);

[y00, M, f0] = enlarge(y00, 64*2);
[y01, M, f0] = enlarge(y01, 64*2);

V0=fft2(G0_F, M, M).*fft2(G0_CH, M, M);
% V0=fft2(G0_F, M, M);
y00 = real( ifft2( fft2(y00,M,M).*V0 ) );
y00 = circularshift(y00, 35+71, 35+71);

V1=fft2(G1_F, M, M).*fft2(G0_CH, M, M);
% V1=fft2(G1_F, M, M);
y01 = real( ifft2( fft2(y01,M,M).*V1 ) );
y01 = wrapadjust(y01, [11+71 11+71]);

y0 = 0.5*(y00 + y01);

% Type 1
%y10 = upsample(y10',2);
%y11 = upsample(y11',2);
%y10=y10';
%y11=y11';
% uf10 = sqrt(2)*upsample2(f10);
% uf11 = sqrt(2)*upsample2(f11);


[y10, M, f1] = enlarge(y10, 64*2);
[y11, M, f1] = enlarge(y11, 64*2);

V2=fft2(G0_F, M, M).*fft2(G1_CH, M, M);
% V2=fft2(G0_F, M, M);
y10 = real( ifft2( fft2(y10,M,M).*V2 ) );
y10 = wrapadjust(y10, [35+23 35+23]);

V3=fft2(G1_F, M, M).*fft2(G1_CH, M, M);
% V3=fft2(G1_F, M, M);
y11 = real( ifft2( fft2(y11,M,M).*V3 ) );
y11 = circularshift(y11, 11+23, 11+23);

y1 = 0.5*(y10 + y11);

% Type 2
%y22 = upsample(y22,2);
%y23 = upsample(y23,2);
% uf22 = sqrt(2)*upsample2(f22);
% uf23 = sqrt(2)*upsample2(f23);


[y22, M, f2] = enlarge(y22, 64*2);
[y23, M, f2] = enlarge(y23, 64*2);
V00=fft2(G0_F, M, M).*fft2(G0_CH, M, M);
% V00=fft2(G0_F, M, M);
y22 = real( ifft2( fft2(y22,M,M).*V00 ) );
y22 = wrapadjust(y22, [35+71 35+71]);

V11=fft2(G1_F, M, M).*fft2(G0_CH, M, M);
% V11=fft2(G1_F, M, M);
y23 = real( ifft2( fft2(y23,M,M).*V11 ) );
y23 = circularshift(y23, 11+71, 11+71);

y2 = 0.5*(y22 + y23);

% Type 3
%y32 = upsample(y32,2);
%y33 = upsample(y33,2);
% uf32 = sqrt(2)*upsample2(f32);
% uf33 = sqrt(2)*upsample2(f33);


[y32, M, f3] = enlarge(y32, 64*2);
[y33, M, f3] = enlarge(y33, 64*2);

V22=fft2(G0_F, M, M).*fft2(G1_CH, M, M);
% V22=fft2(G0_F, M, M);
y32 = real( ifft2( fft2(y32,M,M).*V22 ) );
y32 = circularshift(y32, 35+23, 35+23);

V33=fft2(G1_F, M, M).*fft2(G1_CH, M, M);
% V333=fft2(G1_F, M, M);
y33 = real( ifft2( fft2(y33,M,M).*V33 ) );
y33 = wrapadjust(y33, [11+23 11+23]);

y3 = 0.5*(y32 + y33);

% if f0
%     y0 = y0(1:M1, 1:M1);
%     y1 = y1(1:M1, 1:M1);
%     y2 = y2(1:M1, 1:M1);
%     y3 = y3(1:M1, 1:M1);
% end

xr = idfb2s_rec({y0,y1, y2, y3},1);

%  xr = circularshift(xr, 33, 33);
end

