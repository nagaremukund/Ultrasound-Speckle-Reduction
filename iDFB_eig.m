function [ xr ] = iDFB_eig( Y, DFBtype )
%IDFB_EIG Summary of this function goes here
%   Detailed explanation goes here
if iscell(Y) 
    lhat = ceil(log2(length(Y)));
else
    lhat = 0;
    xr = Y;
    return
end

if nargin < 2, DFBtype = 'r'; end   

switch DFBtype
    case 'r'
        switch lhat
    
             case 1
                 xr = idfb1s_rec(Y,1);
             case 2
                xr = idfb2s_rec(Y,1);
             case 3
                 xr = idfb3s_rec(Y,1);
        end
        
         
end

end

