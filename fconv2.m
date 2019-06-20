function y = fconv2(x, f, shape)
% FCONV2  2-D convolution using fft2
%         Compatible with conv2
%
%	y = fconv2(x, f, shape)
%
% Input:
%   x:      input image
%   shiftsize:  is a vector of integer scalars where
%       the N-th element specifies the shift amount for the N-th dimension
%   shape   : specifies an alternative interpolation method: 
%       'full' 
%       'same'  
%       'valid'  
%
% Output:
%   y:	    subband images 
%
% Note:
%         
% See also: CONV2
% 

if ~exist('shape', 'var')
    shape = 'full';
end

% take size x f
[ma,na] = size(x);
[mb,nb] = size(f);

% if any(size(x) < size(f))
%     error('Size of image must be larger than filter');
% end

M = 2^nextpow2(ma+mb-1); N = 2^nextpow2(na+nb-1);
y = ifft2(fft2(x,M,N).*fft2(f,M,N));

switch shape
    case {'full'}
        y = y(1:ma+mb-1,1:na+nb-1);
    case {'same'}
        mbh = ceil((mb+1)/2); nbh = ceil((nb+1)/2);
        y = y(mbh:mbh+ma-1,nbh:nbh+na-1);
    case {'valid'}
        y = y(mb:ma,nb:na);
    otherwise
        disp('unvalid shape');
end