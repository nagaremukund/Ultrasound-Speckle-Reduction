% Bivariate shrinkage for the STICT
% Z = STICT coeffs, nsig = noise sigma
%
% Ramin Eslami 6-1-05

function Zs = bivariate_STICT(Z, nsig)

Zs = Z;
L = length(Z{1});
% Set the windowsize and the corresponding filter
windowsize  = 5;
windowfilt = ones(1,windowsize)/windowsize;

for k = 1:4, k
    for l = 1:L
    
        Lhat = length(Z{k}{l});
                
            for lhat = 1:Lhat
                Y1 = Z{k}{l}{lhat}; % child
                
                Wsig = conv2(windowfilt,windowfilt,(Y1).^2,'same');
                sighat = sqrt(max(Wsig-nsig^2, eps));
%                 if l ~= L 
%                     NC = length(Z{k}{l});
%                     NP = length(Z{k}{l+1});
%                     plhat = ceil( ((NC > NP)/2+(NC==NP))*lhat ); % parent directional subband
%                     Xp = Z{k}{l+1}{plhat}; 
%                 else 
%               Xp = Z{1}{1}{1}; 
%                 end
                Xp = Z{1}{2}{1}
                Y2 = parent_equivalent(Xp, Y1);
                Y = sqrt( Y1.^2 + Y2.^2 );
                             
                Xhat = (Y > sqrt(3)*nsig^2./sighat) .* ...
                       (Y - sqrt(3)*nsig^2./sighat) .* Y1 ./ Y;
                                                          
                Zs{k}{l}{lhat} = Xhat; %                 
            
        end
        
    end
end
         