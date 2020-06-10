%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
F = readraw('LightHouse.raw');
T = 128;
G = F;
for i = 1:375000
    if G(i) < T
        G(i) = 0;
    elseif G(i) >= 128
        G(i) = 255;
    end
end

count = writeraw(G, 'fixed_thresholding_output.raw');


