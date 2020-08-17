% problem 1b
%RF and SVM
L5 = [1 ;4; 6; 4; 1];
E5 = [-1; -2; 0; 2; 1];
S5 = [-1; 0; 2; 0; -1];
W5 = [-1; 2; 0; -2; 1];
R5 = [1; -4; 6; -4; 1];
row = 128; col = 128;
addpath('C:\Users\shrey\Desktop\Homework 4\HW4_image\HW4_image\train');
f36 =[];

G= readraw('blanket1.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F1 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('blanket2.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F2 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('blanket3.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F3 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('blanket4.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F4 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('blanket5.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F5 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('blanket6.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F6 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('blanket7.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F7 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('blanket8.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F8 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('blanket9.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F9 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('brick1.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F10 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('brick2.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F11 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('brick3.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F12 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('brick4.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F13 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('brick5.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F14 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('brick6.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F15 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('brick7.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F16 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('brick8.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F17 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('brick9.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F18 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('grass1.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F19 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('grass2.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F20 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('grass3.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F21 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('grass4.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F22 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('grass5.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F23 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('grass6.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F24 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('grass7.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F25 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('grass8.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F26 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('grass9.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F27 = feature_vector(L5,E5,S5,W5,R5,out,row,col);

G= readraw('rice1.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F28 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('rice2.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F29 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('rice3.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F30 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('rice4.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F31 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('rice5.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F32 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('rice6.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F33 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('rice7.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F34 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('rice8.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F35 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
G= readraw('rice9.raw');
ext_im = boundary_extension(G);
out = sub_image_mean(ext_im,row,col);
F36 = feature_vector(L5,E5,S5,W5,R5,out,row,col);
F = [F1;F10;F19;F28;F2;F11;F20;F29;F3;F12;F21;F30;F4;F13;F22;F31;F5;F14;F23;F32;F6;F15;F24;F33;F7;F16;F25;F34;F8;F17;F26;F35;F9;F18;F27;F36];
for i = 1:36
    F_36(i,1:14) = F(i,2:15)/F(i,1);
end

label=['0';'1';'2';'3';'0';'1';'2';'3';'0';'1';'2';'3';'0';'1';'2';'3';'0';'1';'2';'3';'0';'1';'2';'3';'0';'1';'2';'3';'0';'1';'2';'3';'0';'1';'2';'3'];

f = pca(F');
F = f(:,1:3);
%RF
B = TreeBagger(500,F,label,'Method','classification')

%SVM
t = templateLinear();
rng(1); % For reproducibility 

SVMModel = fitcecoc(F,label);
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

F_test = [f1;f2;f3;f4;f5;f6;f7;f8;f9;f10;f11;f12];

for i = 1:12
    F_14(i,1:14) = F_test(i,2:15)/F_test(i,1);
end

s = pca(F_14');
YRtest = s(:,1:3);
y = B.predict(YRtest);
[label,score] = predict(SVMModel,YRtest);

true_label = [2;0;0;1;3;2;1;3;3;1;0;1];
