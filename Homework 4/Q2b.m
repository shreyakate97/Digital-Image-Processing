run('C:\Users\shrey\Downloads\vlfeat-0.9.21-bin.tar\vlfeat-0.9.21-bin\vlfeat-0.9.21\toolbox\vl_setup')
addpath('C:\Users\shrey\Desktop\Homework 4\HW4_image\HW4_image');

H1 = imread('Husky_1.jpg');
Husky1 = single(rgb2gray(H1));
H2 = imread('Husky_2.jpg');
Husky2 = single(rgb2gray(H2));
H3 = imread('Husky_3.jpg');
Husky3 = single(rgb2gray(H3));
P1 = imread('Puppy_1.jpg');
Puppy1 = single(rgb2gray(P1));
figure(1);
imshow(Husky3/255)

[F1,d1] = vl_sift(Husky3);
a = vl_plotframe(F1(:,109:254));
b = vl_plotframe(F1(:,109:254));
set(a,'color','k','linewidth',3);
set(b,'color','y','linewidth',2) ;
c = vl_plotsiftdescriptor(d1(:,109:254),F1(:,109:254));
set(c,'color','g') ;
idx = [];
for i = 109:254
    scale = F1(3,i);
    idx = [idx; i scale];
end
idx = sortrows(idx,2,'descend');
index = idx(7);
figure(2);
imshow(Husky3/255)
a = vl_plotframe(F1(:,index));
b = vl_plotframe(F1(:,index));
set(a,'color','k','linewidth',3);
set(b,'color','y','linewidth',2) ;
c = vl_plotsiftdescriptor(d1(:,index),F1(:,index));
set(c,'color','g') ;

figure(3);
imshow(Husky1/255)

[F2,d2] = vl_sift(Husky1);
a = vl_plotframe(F2(:,44:102));
b = vl_plotframe(F2(:,44:102));
set(a,'color','k','linewidth',3);
set(b,'color','y','linewidth',2) ;
c = vl_plotsiftdescriptor(d2(:,44:102),F2(:,44:102));
set(c,'color','g') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% for problem 2 (b) part 2.

% [matches scores] = vl_ubcmatch(d1,d2);
% 
% figure;
% imagesc(cat(2, H3, H1)) ;
% 
% xa = F1(1,matches(1,:)) ;
% xb = F2(1,matches(2,:)) + size(Husky3,2);
% ya = F1(2,matches(1,:)) ;
% yb = F2(2,matches(2,:)) ;
% 
% hold on ;
% h = line([xa ; xb], [ya ; yb]) ;
% set(h,'linewidth', 1, 'color', 'b') ;
% 
% vl_plotframe(F1(:,matches(1,:)));
% F2(1,:) = F2(1,:) + size(Husky3,2) ;
% vl_plotframe(F2(:,matches(2,:))) ;
% axis image off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(d2);
da=double(d2'); db=double(d1');
for i=1:n
    temp = (da(i,:)-db(index,:));
    temp = sum(temp.^2);
    dist(i,:)=sqrt(temp);
end
[value,ind]= min(dist);

 figure(4) ;
subplot(1,2,1);
imshow(H3);
h1 = vl_plotframe(F1(:,index)) ;
set(h1,'color','r','linewidth',3) ;
h3 = vl_plotsiftdescriptor(d1(:,index),F1(:,index)) ;

subplot(1,2,2);
imshow(H1);
h1 = vl_plotframe(F2(:,ind)) ;
set(h1,'color','r','linewidth',3) ;
h3 = vl_plotsiftdescriptor(d2(:,ind),F2(:,ind)) ;
