% to obtain the equivalent parent matrix whith the same size as child 
% for use in STICT bivariate shrinkage
%
% Ramin Eslami 6-1-05

function Yp = parent_equivalent(Xp, Xc)

[NProw NPcol] = size(Xp); % parent
[NCrow NCcol] = size(Xc); % child

row_flag = NCrow / NProw - 1;
col_flag = NCcol / NPcol - 1;

if row_flag <= 0
    row_flag = -NProw/NCrow;
end

if col_flag <= 0
    col_flag =  -NPcol/NCcol;
end


Yp = parent_adjust(Xp, row_flag, col_flag);
