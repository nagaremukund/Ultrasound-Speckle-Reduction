function [Z, Z1 , X_denoisd] = TIDFB_eig_Denoise( imn1, Dir, DFBtype, thresh )
%TIDFB_EIG_DENOISE Summary of this function goes here
%   Detailed explanation goes here
% 
 if nargin < 5, boundary = 1; end
if nargin < 4, thresh = 'h'; end

% [N1 N2] = size(xn);

% ======================Ddecompostion step=====================

 Z = TIDFB_eig(imn1, Dir, DFBtype);
 
% %  %=================================================================
 [c,s]=wavedec2(imn1,1,'bior4.4'); % robust median estimator
H=c((end-prod(s(1,:))):end);
nsig = median(abs(H(:)))/0.6745; 
% % %  mju; 
% % % ======================threshold the  subbands=====================
% 
% 
% %     for k=1:1,
% %         for l=1:length(Z{1})
% %                  
% %         Lhat = length(Z{k}{l})
% %          for lhat = 1:Lhat
% %         Z1{k}{l} = hardthresh(Z{k}{l}{Lhat}, 3*nsig);
% %          end 
% %         end, 
% %     end
% % ===================================================================
% 
% 
if thresh == 'st'
    Z1 = bivariate_STICT(Z, nsig); 
elseif thresh == 'b'
    Z1 = bivariate_TIWT(Z, nsig); 
elseif thresh == 'h'
    Z1 = cellthresh(Z, 3*nsig);
elseif thresh(1) == 'v'
    Z1 = cellthresh(Z, str2num(thresh(2:end)));
elseif thresh == 'bh'
    [Y3_Thresh] =Thresholding_2d(Z{1}{3},1,'Hard',0.51);
Z1=Z;
Z1{1}{3}=[ Y3_Thresh]
% Z1{1}{3}=[Z{1}{3}{1} Y3_Thresh]
elseif thresh == 'ksigma'
% K-sigma rule
    for k=1:1,
        for l=1:length(Z{1})
        Z1{k}{l} = cellthresh(Z{k}{l}, 3*nsig);
        end, 
    end

 end
% 



% % 
% % 
% % for k=1:1,
% %         for l=2:length(Z{1})
% %         Z{k}{l} = process_bands(Z{k}{l},3*nsig);
% %         end, 
% %  end
% 

% ======================Reconstruction Step=====================
%     Z1=Z;

  X_denoisd = iTIDFB_eig(Z1, DFBtype);
end

