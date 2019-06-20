% efficient realization of the inverse TILP function
%
% Ramin Eslami 6-1-05

function xr = iTILP_sep(c,D)

load lppolyfilters

D0 = D{1};
D1 = D{2};
D2 = D{3};
D3 = D{4};

L = length(D0);

for k = L:-1:1

    if k > 1
        ug = removezero(upsample(g, 2^(k-1)));
        uh0 = removezero(upsample(h02, 2^(k-1)));
        uh1 = removezero(upsample(h12, 2^(k-1)));
    else
        ug = g; uh0 = h02; uh1 = h12;
    end

    d1 = circularshift(D1{k}, 0, -2^(k-1));
    d2 = circularshift(D2{k}, -2^(k-1), 0);
    d3 = circularshift(D3{k}, -2^(k-1), -2^(k-1)); 

    
    d00 = filt2d_sep(D0{k}, uh0, 1);
    d11 = filt2d_sep(d1, uh1, 1);
    
    d0d1 = filt2d_sep(d00+d11, 1, uh0);
        
    d20 = filt2d_sep(d2, uh0, 1);
    d31 = filt2d_sep(d3, uh1, 1);
    
    d2d3 = filt2d_sep(d20+d31, 1, uh1);
    
    CDHG = filt2d_sep(c - d0d1 - d2d3, ug, ug);
    

    % New value of a.
    c = (D0{k}+d1+d2+d3+CDHG)/4;    
 
end

xr = c;