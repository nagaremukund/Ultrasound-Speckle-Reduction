close all
clear all
load('filters_D_F3.mat')
M=512
im = ((imread('kidney_cut.bmp')));
imn=imresize(((im)),[M M]);

V0=fft2(H0_D, M, M);
figure,imshow(V0)
V1=fft2(H1_D, M, M);
figure,imshow(V1)
V0=conv2(imn,H0_D)

V0=fft2(imn).*fft2(H0_D, M, M).*fft2(H0_F, M, M);
figure,imshow(V0)
V1=fft2(imn)*fft2(H1_D, M, M).*fft2(H0_F, M, M);
figure,imshow(V1)
V2=fft2(imn)*fft2(H0_D, M, M).*fft2(H1_F, M, M);
figure,imshow(V2)
V3=fft2(imn)*fft2(H1_D, M, M).*fft2(H1_F, M, M);
figure,imshow(V3)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V0=fft2(imn)*fft2(H0_D, M, M).*fft2(H0_F, M, M).*fft2(H0_CH, M, M);
figure,imshow(V0)
V1=fft2(H1_D, M, M).*fft2(H0_F, M, M).*fft2(H0_CH, M, M);
figure,imshow(V1)
V2=fft2(H0_D, M, M).*fft2(H1_F, M, M).*fft2(H1_CH, M, M);
figure,imshow(V2)
V3=fft2(H1_D, M, M).*fft2(H1_F, M, M).*fft2(H1_CH, M, M);
figure,imshow(V3)
%%%%%%%%%%%%%%%%%%%%%%fan+chbd

V0=fft2(H0_F, M, M);
figure,imshow(V0)
V1=fft2(H1_F, M, M);
figure,imshow(V1)

V0=fft2(H0_F, M, M).*fft2(H0_CH, M, M)
figure,imshow(V0)
V1=fft2(H1_F, M, M).*fft2(H0_CH, M, M);
figure,imshow(V1)
V2=fft2(H0_F, M, M).*fft2(H1_CH, M, M);
figure,imshow(V2)
V3=fft2(H1_F, M, M).*fft2(H1_CH, M, M);
figure,imshow(V3)
% figure,freqz2(G1_CH)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%D+F+CHBD
V0=fft2(H0_D, M, M).*fft2(H0_F, M, M).*fft2(H0_CH, M, M);
figure,imshow(V0)
V1=fft2(H0_D, M, M).*fft2(H1_F, M, M).*fft2(H0_CH, M, M);
figure,imshow(V1)
V2=fft2(H0_D, M, M).*fft2(H0_F, M, M).*fft2(H1_CH, M, M);
figure,imshow(V2)
V3=fft2(H0_D, M, M).*fft2(H1_F, M, M).*fft2(H1_CH, M, M);
figure,imshow(V3)

V4=fft2(H1_D, M, M).*fft2(H0_F, M, M).*fft2(H0_CH, M, M);
figure,imshow(V4)
V5=fft2(H1_D, M, M).*fft2(H1_F, M, M).*fft2(H0_CH, M, M);
figure,imshow(V5)
V6=fft2(H1_D, M, M).*fft2(H0_F, M, M).*fft2(H1_CH, M, M);
figure,imshow(V6)
V7=fft2(H1_D, M, M).*fft2(H1_F, M, M).*fft2(H1_CH, M, M);
figure,imshow(V7)


%+++++++++++++++++++++++++synthesis
V0=fft2(G0_F, M, M).*fft2(G0_CH, M, M);
figure,imshow(V0)
V1=fft2(G1_F, M, M).*fft2(G0_CH, M, M);
figure,imshow(V1)
V2=fft2(G0_F, M, M).*fft2(G1_CH, M, M);
figure,imshow(V2)
V3=fft2(G1_F, M, M).*fft2(G1_CH, M, M);
figure,imshow(V3)


V0=fft2(G0_D, M, M).*fft2(G0_F, M, M).*fft2(G0_CH, M, M);
figure,imshow(V0)
V1=fft2(G0_D, M, M).*fft2(G1_F, M, M).*fft2(G0_CH, M, M);
figure,imshow(V1)
V2=fft2(G0_D, M, M).*fft2(G0_F, M, M).*fft2(G1_CH, M, M);
figure,imshow(V2)
V3=fft2(G0_D, M, M).*fft2(G1_F, M, M).*fft2(G1_CH, M, M);
figure,imshow(V3)

V4=fft2(G1_D, M, M).*fft2(G0_F, M, M).*fft2(G0_CH, M, M);
figure,imshow(V4)
V5=fft2(G1_D, M, M).*fft2(G1_F, M, M).*fft2(G0_CH, M, M);
figure,imshow(V5)
V6=fft2(G1_D, M, M).*fft2(G0_F, M, M).*fft2(G1_CH, M, M);
figure,imshow(V6)
V7=fft2(G1_D, M, M).*fft2(G1_F, M, M).*fft2(G1_CH, M, M);
figure,imshow(V7)