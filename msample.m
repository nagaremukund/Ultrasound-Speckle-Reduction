% Multirate Downsampling (does not wrap the output image)
% M = sampling matrix (special cases: Q0 = [1 -1; 1 1] and Q1 = [1 1; -1 1])
% usage: in quincunx filterbank
% Ramin Eslami

function xs = msample(x, q)
% q=1-q;
% [N1, N2] = size(x);
% xs = zeros(fix((N1+N2)/2), fix((N1+N2)/2));  
% 
% if N1 == N2 
%     r=0; N=N1;
% elseif N1 > N2
%     r=1;
% elseif N1 < N2
%     r=2;
% end
% 
% switch r
% case 0
% 
% if q == 0
% 
%   for n1 = 1:fix((N+1)/2)
%       for n2 = 1-n1:n1-1
%         
%           xs(n2 + fix((N+1)/2), n1) = x(n1+n2, n1-n2);
%         
%       end
%   end
%   for n1 = fix((N+1)/2)+1:N
%       for n2 = n1-N:N-n1
%         
%           xs(n2 + fix((N+1)/2), n1) = x(n1+n2, n1-n2);
%         
%       end
%   end
%   
% elseif q == 1
%     
%   for n2 = 1:fix((N+1)/2)
%       for n1 = 1-n2:n2-1
%         
%           xs(n2, n1 + fix((N+1)/2)) = x(-n1+n2, n1+n2);
%         
%       end
%   end
%   for n2 = fix((N+1)/2)+1:N
%       for n1 = n2-N:N-n2
%         
%           xs(n2, n1 + fix((N+1)/2)) = x(-n1+n2, n1+n2);
%         
%       end
%   end
%   
% end
% 
% case 1
%     
% if q == 0
% 
%   for n1 = 1:fix((N2+1)/2)
%       for n2 = 1-n1:n1-1
%         
%           xs(n2 + fix((N2+1)/2), n1) = x(n1+n2, n1-n2);
%         
%       end
%   end
%   for n1 = fix((N2+1)/2)+1:fix((N1+1)/2)
%       for n2 = n1-N2:n1-1
%         
%           xs(n2 + fix((N2+1)/2), n1) = x(n1+n2, n1-n2);
%         
%       end
%   end
%   for n1 = fix((N1+1)/2)+1:fix((N1+N2)/2)
%       for n2 = n1-N2:N1-n1
%         
%           xs(n2 + fix((N2+1)/2), n1) = x(n1+n2, n1-n2);
%         
%       end
%   end
%   
% elseif q == 1
%     
%   for n2 = 1:fix((N2+1)/2)
%       for n1 = 1-n2:n2-1
%         
%           xs(n2, n1 + fix((N1+1)/2)) = x(-n1+n2, n1+n2);
%         
%       end
%   end
%   for n2 = fix((N2+1)/2)+1:fix((N1+1)/2)
%       for n1 = 1-n2:N2-n2
%         
%           xs(n2, n1 + fix((N1+1)/2)) = x(-n1+n2, n1+n2);
%         
%       end
%   end
%   for n2 = fix((N1+1)/2)+1:fix((N1+N2)/2)
%       for n1 = n2-N1:N2-n2
%         
%           xs(n2, n1 + fix((N1+1)/2)) = x(-n1+n2, n1+n2);
%         
%       end
%   end
%   
% end
% 
% case 2
%     
% if q == 0
% 
%   for n1 = 1:fix((N1+1)/2)
%       for n2 = 1-n1:n1-1
%         
%           xs(n2 + fix((N2+1)/2), n1) = x(n1+n2, n1-n2);
%         
%       end
%   end
%   for n1 = fix((N1+1)/2)+1:fix((N2+1)/2)
%       for n2 = 1-n1:N1-n1
%         
%           xs(n2 + fix((N2+1)/2), n1) = x(n1+n2, n1-n2);
%         
%       end
%   end
%   for n1 = fix((N2+1)/2)+1:fix((N1+N2)/2)
%       for n2 = n1-N2:N1-n1
%         
%           xs(n2 + fix((N2+1)/2), n1) = x(n1+n2, n1-n2);
%         
%       end
%   end
%   
% elseif q == 1
%     
%   for n2 = 1:fix((N1+1)/2)
%       for n1 = 1-n2:n2-1
%         
%           xs(n2, n1 + fix((N1+1)/2)) = x(-n1+n2, n1+n2);
%         
%       end
%   end
%   for n2 = fix((N1+1)/2)+1:fix((N2+1)/2)
%       for n1 = n2-N1:n2-1
%         
%           xs(n2, n1 + fix((N1+1)/2)) = x(-n1+n2, n1+n2);
%         
%       end
%   end
%   for n2 = fix((N2+1)/2)+1:fix((N1+N2)/2)
%       for n1 = n2-N1:N2-n2
%         
%           xs(n2, n1 + fix((N1+1)/2)) = x(-n1+n2, n1+n2);
%         
%       end
%   end
% 
% end
xs=x;
end