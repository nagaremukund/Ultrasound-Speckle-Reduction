function [y0, y1] = fbdec_csfb(x, h0, h1, extmod)
% FBDEC   Two-channel 2D Filterbank Decomposition
%
%	[y0, y1] = fbdec(x, h0, h1, type1, type2, [extmod])
%
% Input:
%	x:	input image
%	h0, h1:	two decomposition 2D filters
%	type1:	'q', 'p' or 'pq' for selecting quincunx or parallelogram
%		downsampling matrix
%	type2:	second parameter for selecting the filterbank type
%		If type1 == 'q' then type2 is one of {'1r', '1c', '2r', '2c'}
%		If type1 == 'p' then type2 is one of {1, 2, 3, 4}
%			Those are specified in QDOWN and PDOWN
%		If type1 == 'pq' then same as 'p' except that
%		the paralellogram matrix is replaced by a combination 
%		of a  resampling and a quincunx matrices
%	extmod:	[optional] extension mode (default is 'per')
%
% Output:
%	y0, y1:	two result subband images
%
% Note:		This is the general implementation of 2D two-channel
% 		filterbank
%
% See also:	FBDEC_SP

if ~exist('extmod', 'var')
    extmod = 'per';
end

% Stagger sampling if filter is odd-size (in both dimensions)
if all(mod(size(h1), 2))
    shift = [-1; 0];
else
    shift = [0; 0];
end

% Extend, filter and keep the original size
y0 = efilter2(x, h0, extmod);
y1 = efilter2(x, h1, extmod, shift);

% Downsampling
y0 = gendownsample(y0, 2, 'r');
y1 = gendownsample(y1, 2, 'r');

function y = efilter2(x, f, extmod, shift)
% EFILTER2   2D Filtering with edge handling (via extension)
%
%	y = efilter2(x, f, [extmod], [shift])
%
% Input:
%	x:	input image
%	f:	2D filter
%	extmod:	[optional] extension mode (default is 'per')
%	shift:	[optional] specify the window over which the 
%		convolution occurs. By default shift = [0; 0].
%
% Output:
%	y:	filtered image that has:
%		Y(z1,z2) = X(z1,z2)*F(z1,z2)*z1^shift(1)*z2^shift(2)
%
% Note:
%	The origin of filter f is assumed to be floor(size(f)/2) + 1.
%	Amount of shift should be no more than floor((size(f)-1)/2).
%	The output image has the same size with the input image.
%
% See also:	EXTEND2, SEFILTER2

if ~exist('extmod', 'var')
    extmod = 'per';
end

if ~exist('shift', 'var')
    shift = [0; 0];
end

% Periodized extension
sf = (size(f) - 1) / 2;
m = max([size(f)]);
if m > max(size(x))
    f = fitmat(f, max(size(x)) - 1);
    sf = (size(f) - 1) / 2;
end

xext = extend2(x, floor(sf(1)) + shift(1), ceil(sf(1)) - shift(1), ...
	       floor(sf(2)) + shift(2), ceil(sf(2)) - shift(2), extmod);

% y = fconv2(xext, f, 'valid');

if m < 50
    % Convolution and keep the central part that has the size as the input
    y = conv2(xext, f, 'valid');
else
    y = fconv2(xext, f, 'valid');
end

function X = fitmat(Y,N)
% FITMAT   fit a matrix to matrix of size N, truncate or expand if necessary
% Syntax 	
%   X = fitmat(Y,N)
% Input:
%   Y : the matrix to expand or cut
%   N : size of destination matrix , N*N if N is one value
%
% Output:
%   X:	Resulting matrix
%
% Note:
%   See formulat.tex in Tex folder
%      
% See also: 
% History 
% Apr,11,2004 : Creation ...
% Aug,15,2004 : Debug ...


if length(N) == 1
    N = [N,N];
end

test = Y - rot90(Y,2);
test = sum(test(:));

if (test > 10^(-5))
    disp('NOTE, Y not symetric');
%     return;
end

szY = size(Y);
szX = [max(szY(1),N(1)),max(szY(2),N(2))];
Xbig = zeros(szX);

diff = fix((szX-szY)/2);

Xbig(1+diff(1): diff(1)+szY(1),1+diff(2): diff(2)+szY(2))=Y;

X = zeros(N);

diff = fix((szX-N)/2);

X = Xbig(1+diff(1): diff(1)+N(1),1+diff(2): diff(2)+N(2));


function y = extend2(x, ru, rd, cl, cr, extmod, symopt)
% EXTEND2   2D extension
%
%	y = extend2(x, ru, rd, cl, cr, extmod)
%
% Input:
%	x:	input image
%	ru, rd:	amount of extension, up and down, for rows
%	cl, cr:	amount of extension, left and rigth, for column
%	extmod:	extension mode.  The valid modes are:
%       'sym':		symmetric extension (both direction)
%		'per':		periodized extension (both direction)
%		'qper_row':	quincunx periodized extension in row
%		'qper_col':	quincunx periodized extension in column
%   sympopt : optional argument for symmetric extension, affect the center 
%   of symmetry at the four borders of matrix 
%   0 : the border is repeated, 
%   1 : the border is not repeated, the second row (column) is repeated
%   default [1,1,1,1]
%
% Output:
%	y:	extended image
%
% Note:
%	Extension modes 'qper_row' and 'qper_col' are used multilevel
%	quincunx filter banks, assuming the original image is periodic in 
%	both directions.  For example:
%		[y0, y1] = fbdec(x, h0, h1, 'q', '1r', 'per');
%		[y00, y01] = fbdec(y0, h0, h1, 'q', '2c', 'qper_col');
%		[y10, y11] = fbdec(y1, h0, h1, 'q', '2c', 'qper_col'); 
%		
% See also:	FBDEC

if ~exist('symopt','var')
    symopt = [1,1,1,1];
end

[rx, cx] = size(x);
    
switch extmod
    case 'sym'
        y = [x;];
        y = [x(ru+symopt(1):-1:1+symopt(1),cl+symopt(3):-1:1+symopt(3)),...
            x(ru+symopt(1):-1:1+symopt(1),:),...
            x(ru+symopt(1):-1:1+symopt(1),cx-symopt(4):-1: (cx-cr-symopt(4)+ 1 ) );...
            x(:,cl+symopt(3):-1:1+symopt(3)), ...
            x, ...
            x(:, cx-symopt(4):-1: (cx-cr-symopt(4)+ 1 ) ); ...
            x(rx-symopt(2):-1: (rx-rd-symopt(2)+1),cl+symopt(3):-1:1+symopt(3)), ... 
            x(rx-symopt(2):-1: (rx-rd-symopt(2)+1) ,:), ...
            x(rx-symopt(2):-1: (rx-rd-symopt(2)+1) ,cx-symopt(4):-1: (cx-cr-symopt(4)+ 1 ) ) ];
    case 'per'
	I = getPerIndices(rx, ru, rd);
	y = x(I, :);
	
	I = getPerIndices(cx, cl, cr);
	y = y(:, I);
	
    case 'qper_row'
	rx2 = round(rx / 2);
		
	y = [[x(rx2+1:rx, cx-cl+1:cx); x(1:rx2, cx-cl+1:cx)], x, ...
	     [x(rx2+1:rx, 1:cr); x(1:rx2, 1:cr)]];
	
	I = getPerIndices(rx, ru, rd);
	y = y(I, :);	
	
    case 'qper_col'
	cx2 = round(cx / 2);
	
	y = [x(rx-ru+1:rx, cx2+1:cx), x(rx-ru+1:rx, 1:cx2); x; ...
	     x(1:rd, cx2+1:cx), x(1:rd, 1:cx2)];
	
	I = getPerIndices(cx, cl, cr);
	y = y(:, I);
	
    otherwise
	error('Invalid input for EXTMOD')
end	

%----------------------------------------------------------------------------%
% Internal Function(s)
%----------------------------------------------------------------------------%
function I = getPerIndices(lx, lb, le)

I = [lx-lb+1:lx , 1:lx , 1:le];

if (lx < lb) | (lx < le)
    I = mod(I, lx);
    I(I==0) = lx;
end

% A general downsample for 2-D signals in rows or columns
% RorC = 'r' for sampling in row directions and 'c' in the column
% directions
% N is the number of sampling
% shift is the shift in the sampling 
% Ramin Eslami

function xds = gendownsample(x, N, RorC, shift)

[Mr, Mc] = size(x);
if nargin < 4, shift = 0; end

switch RorC
    
    case 'r'
        
        if Mr <= N, xds = x; return, end

        xs = circularshift(x, mod(shift, N), 0);

        xds = downsample(xs, N);
        
        % It is assumed that shift divides N; rem(N, shift)=0
        
    case 'c'
        
        if Mc <= N, xds = x; return, end

        xs = circularshift(x, 0, mod(shift, N));

        xds = downsample(xs', N)';
        
        % It is assumed that shift divides N; rem(N, shift)=0
        
end

% Ramin Eslami Implementation

function xs = circularshift(x, i, j)

[m, n] = size(x);
xs = wrapadjust(x, [mod(i, m), mod(j, n)]);

%  Ramin Eslami Implementation

function xa = wrapadjust(x, N)
N1 = N(1); N2 = N(2);
% adjust the wrapping of the image resulted from ifft2 in filtering of an image
% through fft method. N1xN2 is the size of the filter used

xa = zeros(size(x));

xa(1:end-N1,1:end-N2) = x(N1+1:end, N2+1:end);

xa(end-N1+1:end, 1:end-N2) = x(1:N1, N2+1:end);

xa(1:end-N1, end-N2+1:end) = x(N1+1:end, 1:N2);

xa(end-N1+1:end, end-N2+1:end) = x(1:N1, 1:N2);
