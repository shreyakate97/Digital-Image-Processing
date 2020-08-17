 L = [1 ;4; 6; 4; 1];
E = [-1; -2; 0; 2; 1];
S = [-1; 0; 2; 0; -1];
W = [-1; 2; 0; -2; 1];
R = [1; -4; 6; -4; 1];
addpath('C:\Users\shrey\Desktop\Homework 4\HW4_image\HW4_image');
G = readraw('comp.raw');

%convert to square matrix
row=450; col=600;
F = [];
for i = 0:(row-1)
    out = G(1+(i*col):col+(i*col));
    F = [ F; out];
end
figure(1); imshow(F/255);
%boundary extension
a = zeros(row+2,col+2);
a(3:row+2,3:col+2) = F;
%add rows
a(1,3:col+2) = F(2,:);
a(2,3:col+2) = F(1,:);
a(row+3,3:col+2) = F(row,:);
a(row+4,3:col+2) = F(row-1,:);
%add columns
a(3:row+2,1) = F(:,2);
a(3:row+2,2) = F(:,1);
a(3:row+2,col+3) = F(:,col);
a(3:row+2,col+4) = F(:,col-1);

out = sub_image_mean(a,row,col);

e1 = f_extraction_1c(L*L',out,row,col); 
e2 = f_extraction_1c(L*E',out,row,col); 
e3 = f_extraction_1c(L*S',out,row,col);
e4 = f_extraction_1c(L*W',out,row,col);
e5 = f_extraction_1c(L*R',out,row,col);

e6 = f_extraction_1c(E*L',out,row,col); 
e7 = f_extraction_1c(E*E',out,row,col);
e8 = f_extraction_1c(E*S',out,row,col);
e9 = f_extraction_1c(E*W',out,row,col);
e10 = f_extraction_1c(E*R',out,row,col);

e11 = f_extraction_1c(S*L',out,row,col);
e12 = f_extraction_1c(S*E',out,row,col);
e13 = f_extraction_1c(S*S',out,row,col);
e14 = f_extraction_1c(S*W',out,row,col);
e15 = f_extraction_1c(S*R',out,row,col);

e16 = f_extraction_1c(W*L',out,row,col);
e17 = f_extraction_1c(W*E',out,row,col);
e18 = f_extraction_1c(W*S',out,row,col);
e19 = f_extraction_1c(W*W',out,row,col);
e20 = f_extraction_1c(W*R',out,row,col);

e21 = f_extraction_1c(R*L',out,row,col);
e22 = f_extraction_1c(R*E',out,row,col);
e23 = f_extraction_1c(R*S',out,row,col);
e24 = f_extraction_1c(R*W',out,row,col);
e25 = f_extraction_1c(R*R',out,row,col);
%25D
% f_vector1 = [e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 e14 e15 e16 e17 e18 e19 e20 e21 e22 e23 e24 e25];
%15D
f1 = e1;
f2 =(e2+e6)/2;  
f3=(e3+e11)/2; 
f4=(e4+e16)/2; 
f5=(e5+e21)/2;
f6 = e7; 
f7=(e8+e12)/2; 
f8=(e9+e17)/2;
f9=(e10+e22)/2; 
f10=e13;
f11=(e14+e18)/2;
f12 = (e15+e23)/2;
f13=e19;
f14=(e20+e24)/2;
f15=e25;

n = 25;
energy1 = window_energy(f1,row,col,n);
energy2 = window_energy(f2,row,col,n);
energy3 = window_energy(f3,row,col,n);
energy4 = window_energy(f4,row,col,n);
energy5 = window_energy(f5,row,col,n);
energy6 = window_energy(f6,row,col,n);
energy7 = window_energy(f7,row,col,n);
energy8 = window_energy(f8,row,col,n);
energy9 = window_energy(f9,row,col,n);
energy10 = window_energy(f10,row,col,n);
energy11 = window_energy(f11,row,col,n);
energy12 = window_energy(f12,row,col,n);
energy13 = window_energy(f13,row,col,n);
energy14 = window_energy(f14,row,col,n);
energy15 = window_energy(f15,row,col,n);

k=1;
for i=1:row
    for j=1:col
        e=[energy2(i,j) energy3(i,j) energy4(i,j) energy5(i,j) energy6(i,j) energy7(i,j) energy8(i,j) energy9(i,j) energy10(i,j) energy11(i,j) energy12(i,j) energy13(i,j) energy14(i,j) energy15(i,j)];  
        e=e./energy1(i,j);
        data(k,:)=e;
        k=k+1;
    end
end

cluster = kmeans(data,6);
regions = [0, 51, 102, 153, 204, 255];

k = 1;
output = zeros(450,600);
for i = 1:row
    for j = 1:col
        cluster_number = cluster(k,1);
        output(i,j) = regions(cluster_number);
        k = k+1;
    end
end
count = writeraw(output,'output1.raw');
figure(2);
imshow(output/255);

% problem 1 (d)
%compute mean
x = pca(data');
YR = x(:,6:12);
cluster = kmeans(YR,6);
regions = [0, 51, 102, 153, 204, 255];
% regions = [ 0 42 84 126 168 210 255];
k = 1;
output = zeros(450,600);
for i = 1:row
    for j = 1:col
        cluster_number = cluster(k,1);
        output(i,j) = regions(cluster_number);
        k = k+1;
    end
end
count = writeraw(output,'output2.raw');
figure(3);
imshow(output/255);