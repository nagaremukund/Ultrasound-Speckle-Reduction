% a function called by parent_equivalent
%
% Ramin Eslami 6-1-05

function y = parent_adjust(x, row_flag, col_flag)

[N,M] = size(x);
y = x;

if row_flag == 1

    N = 2*N;
    y(1:2:N, :) = x;
    y(2:2:N, :) = x;
    x= y;
    
end
    
if col_flag == 1

    M = 2*M;
    y(:, 1:2:M) = x;
    y(:, 2:2:M) = x;
    
end

if row_flag <= 0 % parent row size is twice (in the case of STICT)
    y = downsample(y, -row_flag);
    x = y;
end

if col_flag <= 0 % parent column size is twice or more (in the case of STICT)
    y = downsample(y', -col_flag)';
end
