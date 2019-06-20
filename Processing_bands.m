
%This is just processing on subband 

function [LHI1 HLI1]=Processing_bands(LH1,HL1,thld)
[M1 N1]=size(LH1);

[xi1 yi1]=meshgrid(1:((N1-1)/(2*N1)):N1,1:((M1-1)/(2*M1)):M1);
LHI11=interp2(LH1,xi1,yi1,'bicubic');%figure,imshow(LHI1)
[M2 N2]=size(HL1);
[xi11 yi11]=meshgrid(1:((N2-1)/(2*N2)):N2,1:((M2-1)/(2*M2)):M2);
HLI11=interp2(HL1,xi11,yi11,'bicubic');%figure,imshow(LHI1)

% LHI111=imresize(LH1,[128 128],'bicubic');

% LHI1=(LHI11+LH1)./2;
% HLI1=(HLI11+HL1)./2;

% cnt=1;
%for thld=0:120.01;
%thld=25;
%Use hard-thresholding
LHII1=LHI11;
 LHI1 = abs(LHII1);
 HLII1=HLI11;
HLI1 = abs(HLII1);
 
[M N]=size(LHI1);
for i=1:M
for j=1:N
if LHI1(i,j)<=thld
    LHI1(i,j)=0;
end
if HLI1(i,j)<=thld
    HLI1(i,j)=0;
end
% if HHI1(i,j)<=thld
%     HHI1(i,j)=0;
% 
% end
end
end

%Soft Thresholding
% LHII1=LHI11;
% LHI1 = abs(LHII1);
% LHI1 = sign(LHII1).*(LHI1 >= thld).*(LHI1 - thld); 
% 
% HLII1=HLI11;
% HLI1 = abs(HLII1);
% HLI1 = sign(HLII1).*(HLI1 >= thld).*(HLI1 - thld); 

