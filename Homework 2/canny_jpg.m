%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
image = imread('Dogs.jpg');
imshow(image)

Y = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140*image(:,:,3);
imshow(Y)

BW1 = edge(Y,'Canny', 0.2);
for i = 1:321
    for j = 1:481
        if BW1(i,j) == 1
            BW1(i,j) = 0;
        elseif BW1(i,j) == 0
            BW1(i,j) = 1;
        end
    end
end
imshow(BW1)
