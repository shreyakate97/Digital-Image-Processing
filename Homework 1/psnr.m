%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: January 28, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

G = readraw('Corn_gray.raw'); %original image

G1 = readraw('Corn_denoised_bilateral.raw');
G2 = readraw('Corn_denoised_gaussian.raw');
G3 = readraw('Corn_denoised_linear.raw');

n = 320; m = 320; mse1 = 0; max = 255;
mse2 = 0; mse3 = 0;
for i = 1:102400
        mse1 = mse1 + (G1(i) - G(i))^2;
        mse2 = mse2 + (G2(i) - G(i))^2;
        mse3 = mse3 + (G3(i) - G(i))^2;
end

mse1 = (1/(n*m))*mse1;
mse2 = (1/(n*m))*mse2;
mse3 = (1/(n*m))*mse3;

psn1 = 10*log10((max^2)/mse1);
psn2 = 10*log10((max^2)/mse2);
psn3 = 10*log10((max^2)/mse3);
disp('psnr for bilateral filter:')
disp(psn1); 
disp('psnr for linear filter:')
disp(psn2); 
disp('psnr for gaussian filter:')
disp(psn3);


