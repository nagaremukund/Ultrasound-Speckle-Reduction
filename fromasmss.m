%In this demo, a 2D Ultrasound image is filtered with the Anisotropic Diffusion
%Filter with memory. Probabilty maps are learned in each iteration
%
%G. Ramos-Llorden et al., "Anisotropic Diffusion Filter With Memory Based 
%on Speckle Statistics for Ultrasound Images," IEEE Trans. Image Process., 
%vol.24, no.1, pp.345,358, Jan. 2015.

%Original image obtained from 
%http://telin.ugent.be/~sanja/Sanja_files/UltrasoundDemo.htm
%%
addpath('D:\VISION 2020-Ph.D Work\6. Matlab Source Toolboxes\ADMSS\ADMSS\ADMSS\')

% clear all, clc, close all
addpath(strcat('D:\VISION 2020-Ph.D Work\6. Matlab Source Toolboxes\ADMSS\ADMSS\ADMSS\','utils'));
% Im0=double(rgb2gray(imread(['D:\VISION 2020-Ph.D Work\6. Matlab Source Toolboxes\ADMSS\ADMSS\ADMSS\','images\US.jpg'])));

% Mask=double((imread(['D:\VISION 2020-Ph.D Work\6. Matlab Source Toolboxes\ADMSS\ADMSS\ADMSS\','/images/Mask.png'])));
%  imn = double(rgb2gray(imread('D:\VISION 2020-Ph.D Work\7. Applications\Denoising of ultrawsound images\Abdomen and retroperitoneum  1.1 Liver\lbox_60896-Afbeelding7.jpg')))
tic
Im0=(imn)
%% Parameters definition
AD_param.sigma=0.1;
AD_param.rho=0.1;
AD_param.nitmax=30;
AD_param.n_memory=15;
AD_param.delta_t=0.5;
AD_param.estim='Gamma';
%% Filtering
Im_filt=ADMSS_2D(Im0,ones(size(Im0)),AD_param); %No background. Mask contains only 1s
%% Visualization
disp('Done!, now visualizing results');
figure(1)
imshow([Im0,Im_filt],[])
title('Original                          Filtered')
toc


[ psnr, SNR1, RMSE1, SSI, MSEE  ] = my_Perfromance_metrics( Im0,Im_filt)