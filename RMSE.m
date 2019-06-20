function M = RMSE(P,Q);
%
%Root mean square error
len=(size(P,1));
wid=(size(P,2));
P=double(P);
Q=double(Q);
M=0;
for i = 1:len
    for j=1:wid
        
      % For a 2-D Image       
        Pr=P(i,j);
        Qr=Q(i,j);

      % For a 3-D image
        
%         Pr=P(i,j,1);
%         Pg=P(i,j,2);
%         Pb=P(i,j,3);
%         
%         Qr=Q(i,j,1);
%         Qg=Q(i,j,2);
%         Qb=Q(i,j,3);
%         
%         mag =((Pr-Qr)^2) + ((Pg-Qg)^2) + ((Pb-Qb)^2);

        %mag =((Pr-Qr)^2) + ((Pg-Qg)^2)
        
        mag=((Pr-Qr)^2);
        M=M+mag;
        
    end
end
M=M/(len*wid);
M=M^0.5;
%Calculates Root mean Square
