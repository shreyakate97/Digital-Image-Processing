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

[F1,d1] = vl_sift(Husky1);
[F2,d2] = vl_sift(Husky2);
[F3,d3] = vl_sift(Husky3);
[F4,d4] = vl_sift(Puppy1);

[idx,C1] = kmeans(double(d1'),8);
[idx,C2] = kmeans(double(d2'),8);
[idx,C3] = kmeans(double(d3'),8);
[idx,C4] = kmeans(double(d4'),8);
[m,n]=size(d3);
 data=double(d3'); 
 min_dist1 = 10000; min_dist2 = 10000; min_dist3 = 10000;
 for i=1:8
      dist(1,1:2)=[1  sqrt(sum((C3(i,:)-C1(1,:)).^2))];
      dist(2,1:2)=[2 sqrt(sum((C3(i,:)-C1(2,:)).^2))];
      dist(3,1:2)=[3 sqrt(sum((C3(i,:)-C1(3,:)).^2))];
      dist(4,1:2)=[4 sqrt(sum((C3(i,:)-C1(4,:)).^2))];
      dist(5,1:2)=[5 sqrt(sum((C3(i,:)-C1(5,:)).^2))];
      dist(6,1:2)=[6 sqrt(sum((C3(i,:)-C1(6,:)).^2))];
      dist(7,1:2)=[7 sqrt(sum((C3(i,:)-C1(7,:)).^2))];
      dist(8,1:2)=[8 sqrt(sum((C3(i,:)-C1(8,:)).^2))];
      
      dist = sortrows(dist,2);
      if dist(1,2) < min_dist1
          min_dist1 = dist(1,2);
      end
      label(i,1) = dist(1,1);
end

 figure(1);
 histogram(label);
 xlim([0.5,8.5]);
 xlabel('Labels');
 ylabel('Frequency');
 title('Histogram of Bag of Words for Husky_3 with Husky1');

 for i=1:8
      dist(1,1:2)=[1  sqrt(sum((C3(i,:)-C2(1,:)).^2))];
      dist(2,1:2)=[2 sqrt(sum((C3(i,:)-C2(2,:)).^2))];
      dist(3,1:2)=[3 sqrt(sum((C3(i,:)-C2(3,:)).^2))];
      dist(4,1:2)=[4 sqrt(sum((C3(i,:)-C2(4,:)).^2))];
      dist(5,1:2)=[5 sqrt(sum((C3(i,:)-C2(5,:)).^2))];
      dist(6,1:2)=[6 sqrt(sum((C3(i,:)-C2(6,:)).^2))];
      dist(7,1:2)=[7 sqrt(sum((C3(i,:)-C2(7,:)).^2))];
      dist(8,1:2)=[8 sqrt(sum((C3(i,:)-C2(8,:)).^2))];
      
      dist = sortrows(dist,2);
      if dist(1,2) < min_dist2
          min_dist2 = dist(1,2);
      end
      label(i,1) = dist(1,1);
end

 figure(2);
 histogram(label);
 xlim([0.5,8.5]);
 xlabel('Labels');
 ylabel('Frequency');
 title('Histogram of Bag of Words for Husky_3 with Husky2');
 
 for i=1:8
      dist(1,1:2)=[1  sqrt(sum((C3(i,:)-C4(1,:)).^2))];
      dist(2,1:2)=[2 sqrt(sum((C3(i,:)-C4(2,:)).^2))];
      dist(3,1:2)=[3 sqrt(sum((C3(i,:)-C4(3,:)).^2))];
      dist(4,1:2)=[4 sqrt(sum((C3(i,:)-C4(4,:)).^2))];
      dist(5,1:2)=[5 sqrt(sum((C3(i,:)-C4(5,:)).^2))];
      dist(6,1:2)=[6 sqrt(sum((C3(i,:)-C4(6,:)).^2))];
      dist(7,1:2)=[7 sqrt(sum((C3(i,:)-C4(7,:)).^2))];
      dist(8,1:2)=[8 sqrt(sum((C3(i,:)-C4(8,:)).^2))];
      
      dist = sortrows(dist,2);
      if dist(1,2) < min_dist3
          min_dist3 = dist(1,2);
      end
      label(i,1) = dist(1,1);
end

 figure(3);
 histogram(label);
 xlim([0.5,8.5]);
 xlabel('Labels');
 ylabel('Frequency');
 title('Histogram of Bag of Words for Husky_3 with Puppy1');
    figure(4);
 b = [min_dist1; min_dist2; min_dist3];
bar(b);
 
