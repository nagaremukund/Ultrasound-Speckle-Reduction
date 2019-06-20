function N = SNR(P,Q);
%
%Calculates the Signal-to-noise radio
R=RMSE(P,Q);
T=0;
P=double(P);
len=(size(P,1));
wid=(size(P,2));

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
%         mag =((Pr^2) + (Pg^2) + (Pb^2));
        mag= (Pr^2) + (Qr^2);
        T=T+mag;
    end
end
if (R==0)
    N=1000000;
else
    T=T/(len*wid);
    T=T^0.5;
    T=T/R;
    N=20*log10(T);
end
%Calculates signal to noise ratio.

%fprintf(' SNR:   %5.3f\t', N);
