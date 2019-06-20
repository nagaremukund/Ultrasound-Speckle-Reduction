function [ Sub1 ] = hardthresh( Sub1,thresh )
%HARDTHRESH Summary of this function goes here
%   Detailed explanation goes here

%Use hard-thresholding

 Sub1 = abs(Sub1);
 
[M N]=size(Sub1);
for i=1:M
for j=1:N
if Sub1(i,j)<thresh
    Sub1(i,j)=0;
end
end
end

