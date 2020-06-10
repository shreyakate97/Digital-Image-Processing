%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: January 28, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

G = readraw('Corn_noisy.raw');
sigma_c = 0.6; sigma_s = 0.4;
out1 = []; imagematrix = [];
%image in matrix form
for i = 0:319
    out = G(1+(i*320):320+(i*320));
    imagematrix = [ imagematrix; out];
end

out1(:,1) = imagematrix(:,2);
out1(:,2) = imagematrix(:,1);
out1(:,3:322) = imagematrix(:,1:320);
out1(:,323) = out1(:,322);
out1(:,324) = out1(:,321);

out1(3:322,:) = out1(:,:);
out1(1,:) = out1(4,:);
out1(2,:) = out1(3,:);
out1(323,:) = out1(322,:);
out1(324,:) = out1(321,:);
 
out2 = zeros(320,320); filter = zeros(5,5);
for k = 3:322
    for l = 3:322
        a = 1; d1 = 0;
        for i= -2:2
            b = 1;
            for j = -2:2
                filter(a,b)=exp(-1*(((i.^2)+(j.^2))/(2*(sigma_c.^2))))*exp(-1*(((abs(out1(k,l)-out1(k+i,l+j))).^2)/(2*(sigma_s.^2))));
                out2(k-2,l-2) = out2(k-2,l-2) + out1(k+i,l+j)*filter(i+3,j+3);
                b= b+1;
            end
            a = a+1;
        end
        d1 =  sum(filter); d2 = sum(d1);
        out2(k-2,l-2) = round((1/d2)*out2(k-2,l-2));
    end
end

count = writeraw(out2, 'Corn_denoised_bilateral.raw');