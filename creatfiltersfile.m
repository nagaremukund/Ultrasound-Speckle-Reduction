load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\H0_DIAM_27x27.mat');
H0_D=actualh/max(max(abs(fft2(actualh))));

load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\H1_DIAM_71x71.mat');
H1_D=H1/max(max(abs(fft2(H1))))
load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\H0_Fan_23x23.mat')
H0_F=actualh/max(max(abs(fft2(actualh))));
load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\H1_Fan_71x71.mat')
H1_F=H1/max(max(abs(fft2(H1))));

load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\H0_CHBD_46x46.mat');
H0_CH=H0/max(max(abs(fft2(H0))))
load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\H1_CHBD_142x142.mat');
H1_CH=H1/max(max(abs(fft2(H1))))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\G0_DIAM_71x71.mat');
G0_D=actualg/max(max(abs(fft2(actualg))))
load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\G1_DIAM_27x27.mat');
G1_D=G1/max(max(abs(fft2(G1))));

load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\G0_Fan_71x71.mat')
G0_F=actualg/max(max(abs(fft2(actualg))));
load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\G1_Fan_23x23.mat')
G1_F=G1/max(max(abs(fft2(G1))));

load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\G0_CHBD_142x142.mat')
G0_CH=G0/max(max(abs(fft2(G0))));

load('D:\VISION 2020-Ph.D Work\3.Matlab Implementation\3.2 PROPOSED_2D\Results_2D_Filter Coeffs_Comparisions\Our Proposed Method\G1_CHBD_46x46.mat')
G1_CH=G1/max(max(abs(fft2(G1))));




save('filters_D_F3.mat')