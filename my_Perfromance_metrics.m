function [ psnr, SNR1, RMSE1, SSI, MSEE  ] = my_Perfromance_metrics( Im0,Im_filt)
%MY_PERFROMANCE_METRICS Summary of this function goes here
%   Detailed explanation goes here

XR=Im_filt
   imn=Im0
Q=double(XR);
W=double(imn);
% err=W-Q;m
% Q=Q+err;
MSE1=0;
 [m,n]=size(Q);
 for x=1:1:m
     for y=1:1:n
         MSE1=MSE1+[(Q(x,y)-W(x,y))*(Q(x,y)-W(x,y))];
     end
 end 
 MSEE=(MSE1)/(m*n);
%  disp(MSE);
 t= 10*log10(MSEE);
%  disp(t);
 q=20*log10((255^2)/sqrt(MSEE));
q1=10*log10((255^2)/sqrt(MSEE));
psnr=q1;
ql=20*log((255^2)/sqrt(MSEE));
ql1=10*log((255^2)/sqrt(MSEE));
PP=psnr2(imn,XR);

%============from  SRAD  toolbox%IDF=================================
RMSE1=RMSE(double(imn),double(XR));
SNR1=SNR(imn,XR);
MSE1=MSE(double(imn),double(XR));
% PP1=psnr2(imn,I_enhanced);
mse = sum( sum( (XR - double(imn)).^2 ) );
mse = mse / prod(size(imn));

SSI=ssim_index((imn),(XR));

% % %===================================from ADDMSSS=========================
% Im_filt=polar2cart(XR,256,inf,10)
% Im0=polar2cart(double(imn),256,inf,10);
% figure(1)
% figure,imshow(log(1+abs([Im0,Im_filt])),[])
end

