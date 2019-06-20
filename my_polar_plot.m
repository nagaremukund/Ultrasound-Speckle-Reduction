function my_polar_plot( imn, XR )
%MY_POLAR_PLOT Summary of this function goes here
%   Detailed explanation goes here
Im_filt=polar2cart(XR,256,inf,10)
Im0=polar2cart(double(imn),256,inf,10);
figure(1)
figure,imshow(log(1+abs([Im0,Im_filt])),[])

end

