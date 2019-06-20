% Filters 2D signal x with 1-D filter h in rows and 1-D filter g in columns
% (separable filtering)
% if h =1 or g=1 we have 1-D filtering
%
% Ramin Eslami 6-1-05

function y = filt2d_sep(x, h, g)

h = h(:)';
[Nr, Nc]=size(x);
y = zeros(Nr, Nc);

if h ~= 1
    H = fft(h, Nc);

    for i = 1:Nr
        y(i,:) = real(ifft(fft( x(i,:)).*H ));
    end
    
    dr = ceil(length(h)/2) - 1;

    y = wrapadjust(y, [0 dr]);

else
    y = x;
end
    
if g ~= 1
    g = g(:);
    G = fft(g, Nr);

    for j = 1:Nc
    y(:,j) = real(ifft(fft( y(:,j)).*G ));
    end

    dc = ceil(length(g)/2) - 1;

    y = wrapadjust(y, [dc 0]);
end