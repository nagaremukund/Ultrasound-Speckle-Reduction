% New DFB 3 func 8-8-2003
% outputmode = 1 : cell array output
% modified 4-8-05 the utput shift is adjusted
%
% Ramin Eslami

function Y3 = dfb3s_dec(x, outputmode)

if nargin < 2, outputmode = 0; end

Y2 = dfb2s_dec(x);
load('filters_D_F3.mat');

y0 = Y2(:,:,1);
y1 = Y2(:,:,2);
y2 = Y2(:,:,3);
y3 =Y2(:,:,4);

[N, N] = size(y0);
M=N;
[y0, M, f0] = enlarge(y0, 64*2);
[y1, M, f1] = enlarge(y1, 64*2);
[y2, M, f2] = enlarge(y2, 64*2);
[y3, M, f3] = enlarge(y3, 64*2);

y0_f = fft2(y0, M, M);
y1_f = fft2(y1, M, M);
y2_f = fft2(y2, M, M);
y3_f = fft2(y3, M, M);

% % Type0
% uh00 = sqrt(2)*upsample2(h00);
% uh01 = sqrt(2)*upsample2(h01);

%directional filt
V0=fft2(H0_F, M, M).*fft2(H0_CH, M, M);
% V0=fft2(H0_F, M, M)
y = real( ifft2( y0_f.*V0 ) );
y00 = wrapadjust(y, [11+23 11+23]);

V1=fft2(H1_F, M, M).*fft2(H0_CH, M, M);
% V1=fft2(H1_F, M, M) )
y = real( ifft2( y0_f.*V1 ));
y01 = wrapadjust(y, [35+23 35+23]);

if f0
    y00 = y00(1:N, 1:N);
    y01 = y01(1:N, 1:N);
end

% R0D*Q0D*Q0U*R0U = D0D*R2D*R2U*D0U = D0D*D0U
%y00 = downsample(y00',2);
%y01 = downsample(y01',2);
%y00=y00';
%y01=y01';

% % Type 1
% uh10 = sqrt(2)*upsample2(h10);
% uh11 = sqrt(2)*upsample2(h11);

V2=fft2(H0_F, M, M).*fft2(H1_CH, M, M);
% V2=fft2(H0_F, M, M)
y = real( ifft2( y1_f.*V2 ) );
y10 = wrapadjust(y, [11+71 11+71]);


V3=fft2(H1_F, M, M).*fft2(H1_CH, M, M);
% V3=fft2(H1_F, M, M);
y = real( ifft2( y1_f.*V3 ) );
y11 = wrapadjust(y, [35+71 35+71]);

if f1
    y10 = y10(1:N, 1:N);
    y11 = y11(1:N, 1:N);
end

% R1D*Q1D*Q1U*R1U = D0D*R3D*R3U*D0U = D0D*D0U
%y10 = downsample(y10',2);     
%y11 = downsample(y11',2); 
%y10=y10';
%y11=y11';

% % Type 2
% uh22 = sqrt(2)*upsample2(h22);
% uh23 = sqrt(2)*upsample2(h23);


V00=fft2(H0_F, M, M).*fft2(H0_CH, M, M);
V00=fft2(H0_F, M, M);
y = real( ifft2( y2_f.*V00 ) );
y22 = wrapadjust(y, [11 11]);


V11=fft2(H1_F, M, M).*fft2(H0_CH, M, M);
% V11=fft2(H1_F, M, M) ;
y = real( ifft2( y2_f.*V11) );
y23 = wrapadjust(y, [35+23 35+23]);

if f2
    y22 = y22(1:N, 1:N);
    y23 = y23(1:N, 1:N);
end

% R2D*Q1D*Q1U*R2U = D1D*R0D*R0U*D1U = D1D*D1U
%y22 = downsample(y22,2);     
%y23 = downsample(y23,2);

% % Type 3
% uh32 = sqrt(2)*upsample2(h32);
% uh33 = sqrt(2)*upsample2(h33);
V22=fft2(H0_F, M, M).*fft2(H1_CH, M, M);
% V22=fft2(H0_F, M, M)
y = real( ifft2( y3_f.* V22) );
y32 = wrapadjust(y, [11+71 11+71]);

V33=fft2(H1_F, M, M).*fft2(H1_CH, M, M);
% V33=fft2(H1_F, M, M);
y = real( ifft2( y3_f.*V33 ) );
y33 = wrapadjust(y, [35+71 35+71]);

if f3
    y32 = y32(1:N, 1:N);
    y33 = y33(1:N, 1:N);
end

% R3D*Q0D*Q0U*R3U = D1D*R1D*R1U*D1U = D1D*D1U
%y32 = downsample(y32,2);     
%y33 = downsample(y33,2); 


if outputmode
    
    Y3 = {msample(y00,1),msample(y01,1),msample(y10,1),msample(y11,1),msample(y22,1),msample(y23,1),msample(y32,1),msample(y33,1)};
    
else

    % Horizontal directions
    Y3(:,:,1) = msample(y00,1);
    Y3(:,:,2) =  msample(y01,1);
    Y3(:,:,3) =  msample(y10,1);
    Y3(:,:,4) =  msample(y11,1);
    % Vertical directions
    Y3(:,:,5) =  msample(y22,1);
    Y3(:,:,6) =  msample(y23,1);
    Y3(:,:,7) =  msample(y32,1);
    Y3(:,:,8) =  msample(y33,1);
    
    %Y3 = {Y3h, Y3v};
    
end