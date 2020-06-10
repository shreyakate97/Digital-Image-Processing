%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: January 28, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% parameters
    sigma = 25;                % noise std
    halfPatchSize = 3;          % half size of the patch
    windowHalfSearchSize = 6;   % half size for searching the neighbors
    N_n = 16;                   % numer of neighbors
    h = 0.3 * sigma^2;          % nlm filtering parameter
    offset = 0.8;
G = readraw('Corn_noisy.raw');
y = readraw('Corn_gray.raw');
z = [];
%image in matrix form
for i = 0:319
    out = G(1+(i*320):320+(i*320));
    z = [ z; out];
end
% img_f = nlm(z, 3, 6, 16, 0.3,  0.027, 0)
img_f = nlm(z, halfPatchSize, windowHalfSearchSize, N_n, sigma, h, offset);

% y_est1 = reshape(y_est,[1,102400]);
count = writeraw(img_f, 'Corn_noisefree_nlm.raw');