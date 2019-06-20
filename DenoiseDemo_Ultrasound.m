%%iF YOU ARE REFERING THESE CODE PLEASE CITE FOLLLOWING WORK.
% 1. Mukund B Nagare, B. D. Patil, Raghunath S. Holambe , "A Multi Directional Perfect
% Reconstruction Filter Bank Designed with 2-D Eigenfilter Approach: Application to
% Ultrasound Speckle Reduction," Journal of Medical Systems, vol. 41, no. 2, p. 31,
% 2016.Springer [Online]. Available: http://dx.doi.org/10.1007/s10916-016-0675-2
% 
% 2.M. B. Nagare, B. D. Patil and R. S. Holambe, "Design of two-dimensional quincunx FIR filter banks using eigen filter approach," 2016 International Conference on Signal and Information Processing (IConSIP), Vishnupuri, 2016, pp. 1-5.
% doi: 10.1109/ICONSIP.2016.7857452
% 
% 3. B. D. Patil, P. G. Patwardhan and V. M. Gadre, "Eigenfilter Approach to the Design of One-Dimensional and Multidimensional Two-Channel Linear-Phase FIR Perfect Reconstruction Filter Banks," in IEEE Transactions on Circuits and Systems I: Regular Papers, vol. 55, no. 11, pp. 3542-3551, Dec. 2008.
% doi: 10.1109/TCSI.2008.925818

clc
clear all;
close all;
%   im = phantom('Modified Shepp-Logan',200);
%   im = ((imread('ultrasound phantom.bmp')))
% im = (rgb2gray(imread('BMode_US1.bmp')))
%        im = ((imread('kidney_cut.bmp')));
%          im = (rgb2gray(imread('ultrasample1.jpg')));
%            im = (imread('barb512.gif'));
        %        im = (imread('origLena.bmp'))
%   im = (imread('20.jpg'));
%                  im = rgb2gray(imread('US.jpg'))
                   im = ((imread('breast_cyst_philips_norm.jpg')));
%     im = (rgb2gray(imread('CCA.bmp')));
%     im = (rgb2gray(imread('schistosomiasis-of-liver.jpg')))
%       im = double((imread('lymph_node_philips_norm.jpg')));
%       im = double((imread('parotid_gland_adenoma_philips.jpg')))
%            im = (rgb2gray(imread('D:\VISION 2020-Ph.D Work\7. Applications\Denoising of ultrasound images\Abdomen and retroperitoneum  1.1 Liver\lbox_60896-Afbeelding7.jpg')))
%      im = (double(imread('IVUS.png')))
%                     im1 = imnoise(im,'speckle',0.01);
  imn=imresize((double(im)),[400 400]);

%   imn=imresize(im,[512 512]);
% %     imn1=log(imn)
% %   imn2=exp(imn1)
%   noise = randn(512,512);
% % % here we show one example: Barbara image at sigma=20
% im = im;
%     sigma = 20;
%     imn = (imn + sigma*noise);
%Apply tree structure proposed by  TRUONG NUYGEN for  UNIFORM QUINCUNX FBs 
%With Diamond and Fan shape filters by eigen filterbank method 
%  imn=ones(512,512)
Dir=[2 3 ];
DFBtype='r';
[X_DirSubBands,th_DirSubBands, denoised_image]= TIDFB_eig_Denoise(imn,Dir,DFBtype,'h');

figure;imshow(im,[]);
title('Original image');

figure;imshow(imn,[]);
title('Noisy  image')

XR1=denoised_image;
   XR=(XR1);
figure;imshow(XR,[]);
title('Denoised image');
  
[ psnr, SNR1, RMSE1, SSI, MSEE  ] = my_Perfromance_metrics( imn,XR)

%