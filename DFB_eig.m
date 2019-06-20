function Y=DFB_eig(x,lhat,DFBtype)

switch DFBtype
    case 'r'
        switch lhat
    
            case 1
                Y = dfb1s_dec(x,1);
             case 2
                Y = dfb2s_dec(x, 1);
             case 3
                 Y = dfb3s_dec(x, 1);
        end
             
end
end

