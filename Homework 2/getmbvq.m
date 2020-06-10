%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function mbvq = getmbvq(R,G,B)
if((R+G) > 255) 
    if((G+B) > 255)
        if((R+G+B) > 510) 
            mbvq = 'CMYW'; 
        else
            mbvq ='MYGC';
        end
    else
        mbvq = 'RGMY';
    end
elseif(~((G+B) > 255)) 
    if(~((R+G+B) > 255)) 
        mbvq = 'KRGB'; 
    else
        mbvq = 'RGBM'; 
    end
else
    mbvq = 'CMGB';
end

end