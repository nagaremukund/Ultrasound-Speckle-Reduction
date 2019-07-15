% 2d TI laplacian pyramid with L level
%
% Ramin Eslami 6-1-05

function [c, D] = TILP_sep(x, L)

load lppolyfilters

uh = h; ug0 = g02; ug1 = g12;


for k = 1:L

    c = filt2d_sep(x, uh, uh);
    cg0 = filt2d_sep(c, ug0, 1);
    cg1 = filt2d_sep(c, ug1, 1);
    
    D0{k} = x - filt2d_sep(cg0, 1, ug0);
    
    D1{k} = x - filt2d_sep(cg1, 1, ug0);
    
    D2{k} = x - filt2d_sep(cg0, 1, ug1);

    D3{k} = x - filt2d_sep(cg1, 1, ug1);
    
    D1{k} = circularshift(D1{k}, 0, 2^(k-1));
    D2{k} = circularshift(D2{k}, 2^(k-1), 0);
    D3{k} = circularshift(D3{k}, 2^(k-1), 2^(k-1));
    % upsample filters.
    uh = removezero(upsample(uh, 2));
    ug0 = removezero(upsample(ug0, 2));
    ug1 = removezero(upsample(ug1, 2));
    
    % New value of x.
    x = c;

end

D = {D0, D1, D2, D3};