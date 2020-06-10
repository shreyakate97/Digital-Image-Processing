%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: January 28, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

G = readraw('Corn_noisy.raw');

out1 = []; imagematrix = [];
%image in matrix form
for i = 0:319
    out = G(1+(i*320):320+(i*320));
    imagematrix = [ imagematrix; out];
end

out1(:,1) = imagematrix(:,1);
out1(:,2:321) = imagematrix(:,1:320);
out1(:,322) = out1(:,321);

out1(2:321,:) = out1(:,:);
out1(1,:) = out1(1,:);
out1(322,:) = out1(321,:);


lf = ones(3,3);
out2 = zeros(320,320);
for k = 2:321
    for l = 2:321
        for i= -1:1
            for j = -1:1
                out2(k-1,l-1) = out2(k-1,l-1) + round(out1(k+i,l+j)*(1/9)*lf(i+2,j+2));
            end
        end
    end
end

count = writeraw(out2, 'Corn_denoised_linear.raw');
out3 = imagematrix - out2;
count1 = writeraw(out3, 'Corn_noise_linear.raw');