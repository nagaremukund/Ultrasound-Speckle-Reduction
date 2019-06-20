function [ xr ] = iTIDFB_eig( Z1, DFBtype )
%ITIDFB_EIG Summary of this function goes here
%   Detailed explanation goes here

L = length(Z1{1});
   X = cell(1, 1);

 for k = 1:4;
    for l = 1:L
    
        X{k}{l} = iDFB_eig( Z1{k}{L-l+1}, DFBtype);
    
    end

end

xr = iTILP_sep(Z1{5}, X);