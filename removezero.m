% removes zeros from around a matrix
%
% Ramin Eslami 6-1-05

function xs = removezero(x)

[M,N] = size(x);

for i=1:M
    if any( x(i,:) )
        break
    end
end
for j=M:-1:1
    if any( x(j,:) )
        break
    end
end
for k=1:N
    if any( x(:,k) )
        break
    end
end
for l=N:-1:1
    if any( x(:,l) )
        break
    end
end

xs = x( i:j,k:l );