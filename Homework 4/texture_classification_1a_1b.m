L5 = [1 ;4; 6; 4; 1];
E5 = [-1; -2; 0; 2; 1];
S5 = [-1; 0; 2; 0; -1];
W5 = [-1; 2; 0; -2; 1];
R5 = [1; -4; 6; -4; 1];
row = 128; col=128;
addpath('C:\Users\shrey\Desktop\Homework 4\HW4_image\HW4_image\test');
G = readraw('1.raw');

ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f1 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('2.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f2 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('3.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f3 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('4.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f4 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('5.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f5 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('6.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f6 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('7.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f7 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('8.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f8 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('9.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f9 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('10.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f10 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('11.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f11 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G = readraw('12.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
f12 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

F = [f1;f2;f3;f4;f5;f6;f7;f8;f9;f10;f11;f12];
% for calculating discriminant power
% for i=1:25
%    variance(i,:)=(sum(((F(:,i)-mean(F(:,i))).^2))/12);
% end
for i = 1:12
    F14(i,1:14) = F(i,2:15)/F(i,1);
end

%compute mean
for i = 1:14
    m = sum(F14(:,i))/12;
    Y(:,i) = F14(:,i)-m;
end

[U,S,V] = svd(Y);

VR = V(:,1:3);

YR = F14*VR;
labels={'1','2','3','4','5','6','7','8','9','10','11','12'};
for i=1:12
figure(1);plot3(YR(i,1),YR(i,2),YR(i,3),'*');hold on;grid on;
text(YR(i,1),YR(i,2),YR(i,3),labels(i));
end  
title('PCA (plot of 3D in feature space)');
xlabel('feature 1');
ylabel('feature 2');
zlabel('feature 3');


% problem 1 b : k means
disp('using 15D');
label = kmeans_1(F14);
disp('using 3D');
label = kmeans_1(YR);
