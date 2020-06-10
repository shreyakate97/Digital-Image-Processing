%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
F = readraw('LightHouse.raw');
G = F;
a = 0;
b = 255;
r = (b-a).*rand(375000,1) + a;

for i = 1:375000
    if G(i) < r(i)
        G(i) = 0;
    elseif G(i) >= r(i) 
        G(i) = 255;
    end
end

count = writeraw(G, 'random_thresholding_output.raw');