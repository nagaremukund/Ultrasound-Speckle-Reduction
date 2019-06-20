% the scaled version (actually the original)
% TIDFB function 7-15-2004 (without downsampling)
% outputmode = 1 : cell array output
% modified 4-8-05 shifts are adjusted
%
% Ramin Eslami

function Y2 = dfb2s_dec(x, outputmode)

if nargin < 2, outputmode = 0; end

Y1 = dfb1s_dec(x);
load('filters_D_F2.mat');

y0f = Y1(:,:,1);
y1f = Y1(:,:,2);


[N, N] = size(y0f);

[y0f, M, f0] = enlarge(y0f, 64*2);
[y1f, M, f1] = enlarge(y1f, 64*2);


y0s = fft2(y0f, M, M);
y1s = fft2(y1f, M, M);


% % Type0
% uh00 = sqrt(2)*upsample2(h00);
% uh01 = sqrt(2)*upsample2(h01);

y = real( ifft2( y0s.*fft2(H0_F, M, M) ) );
y00 = wrapadjust(y, [11 11]);

y = real( ifft2( y0s.*fft2(H1_F, M, M) ) );
y01 = wrapadjust(y, [35 35]);

if f0
    y00 = y00(1:N, 1:N);
    y01 = y01(1:N, 1:N);
end


% % Type 1
% uh10 = sqrt(2)*upsample2(h10);
% uh11 = sqrt(2)*upsample2(h11);

y = real( ifft2( y1s.*fft2(H0_F, M, M) ) );
y10 = wrapadjust(y, [11 11]);

y = real( ifft2( y1s.*fft2(H1_F, M, M) ) );
y11 = wrapadjust(y, [35 35]);

if f1
    y10 = y10(1:N, 1:N);
    y11 = y11(1:N, 1:N);
end

if outputmode
    
    Y2 = { msample(y00,1), msample(y01,1), msample(y10,1), msample(y11,1)};
    
else

    % Horizontal directions
    Y2(:,:,1) = msample(y00,1);
    Y2(:,:,2) = msample(y01,1);
    Y2(:,:,3) = msample(y10,1);
    Y2(:,:,4) = msample(y11,1);
%     % Vertical directions
%     Y3(:,:,5) = y22;
%     Y3(:,:,6) = y23;
%     Y3(:,:,7) = y32;
%     Y3(:,:,8) = y33;

end
end