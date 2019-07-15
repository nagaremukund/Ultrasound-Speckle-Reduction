function [ Z] = TIDFB_eig(x, Lhat, DFBtype);
%TIDFB_EIG Summary of this function goes here
%   Detailed explanation goes here



% if nargin < 3, DFBtype = 'r'; end
L = length(Lhat);
Z = cell(1, 5);

[c D] = TILP_sep(x, L);  % TI Laplacian pyramid
Z{5} = c;
for  k = 1:4
    for l = 1:L
        Z{k}{l} = DFB_eig( x, Lhat(l), DFBtype);
       
    end
end


