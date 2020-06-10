%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% 
ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% addpath('C:\Users\shrey\Desktop\EE 569\Homework 2\EE569_2020_Spring_HW2_Materials\EE569_Spring_2020_HW2_Materials\Problem1');
sobel_edge_detector();

dog = load('Gallery_GT.mat');
dog_gt = dog.groundTruth;addpath('C:\Users\shrey\Desktop\EE 569\Homework 2\edges-master');
[thrs ,cntR, sumR, cntP, sumP, V] = edgesEvalImg(BW1, 'Gallery_GT.mat');

R = cntR./sumR;
P = cntP./sumP;
r = mean(R);
p = mean(P);
F = 2*((p*r)./(p + r));

disp('Mean precision is: '); disp(p);
disp('Mean recall is: '); disp(r);
disp('F-measure is: '); disp(F);