%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
G = readraw('Dogs.raw');

Y = zeros(1, 154401);

for i = 0: 154400
    Y(i+1) = 0.2989*G(3*i + 1) + 0.5870*G(3*i + 2) + 0.1140*G(3*i + 3);
end

out1 = [];
imagematrix = [];
gx_out = [];
temp = [];
for i = 0:320
    out = Y(1+(i*481):481+(i*481));
    imagematrix = [ imagematrix; out];
end
out1(:,1) = imagematrix(:,1);
out1(:,2:482) = imagematrix(:,1:481);
out1(:,483) = out1(:,482);

out1(2:322,:) = out1(:,:);
out1(1,:) = out1(1,:);
out1(323,:) = out1(322,:);

gx = [-1 0 1; -2 0 2; -1 0 1]; gy = [ 1 2 1; 0 0 0; -1 -2 -1];
gx_out = zeros(321,481); gy_out = zeros(321,481);
for k = 2:322
    for l = 2:482
        for i= -1:1
            for j = -1:1
                gx_out(k-1,l-1) = gx_out(k-1,l-1) + out1(k+i,l+j)*gx(i+2,j+2);
                gy_out(k-1,l-1) = gy_out(k-1,l-1) + out1(k+i,l+j)*gy(i+2,j+2);
            end
        end
    end
end
magnitude = sqrt(gx_out.^2 + gy_out.^2 );
norm = magnitude;
for i = 1:321
    for j = 1:481
        if norm(i,j) > 150
            norm(i,j) = 0;
        else
            norm(i,j) = 255;
        end
    end
end
imshow(norm)
count = writeraw(gx_out, 'gxout.raw');
count = writeraw(gy_out, 'gyout.raw');
count = writeraw(magnitude, 'magnitude.raw');
count = writeraw(norm, 'norm.raw');