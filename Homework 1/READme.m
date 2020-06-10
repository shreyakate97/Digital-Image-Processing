% EE569 Homework Assignment #1 
% Submission Date: January 28, 2020 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 1(a):    Bilinear Demosaicing
% Implementation : Bilinear demosaicing, bilinear interpolation
% M-file name:   problem_a.m 
% Output image:   Dog1.raw
%In readraw.m function: put Y = 600; X = 532;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 1(b):    MHC Demosaicing
% Implementation : MHC (Malvar-He-Cutler) demosaicing
% M-file name:   problem_b.m 
% Output image:   Dog2.raw
% In readraw.m function: put Y = 600; X = 532; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 1(c):    Histogram Equalization
% Implementation : Histogram plots, Method A and Method B
% M-file name:   problem_c.m 
% Output image 1:   Toy1.raw  % this is the enhanced image with Method A
% Output image 1:   Toy2.raw  % this is the enhanced image with Method B
% In readraw.m function: put Y = 400; X = 560; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 2(a):    Denoising using linear and gaussian filters
% Implementation 1 : Denoising using linear filter
% M-file name 1:   problem2_a.m 
% Output image 1:   Corn_denoised_linear.raw
% Implementation 2 : Denoising using gaussian filter
% M-file name 2:   problem2_gaussianfilter.m 
% Output image 2:   Corn_denoised_gaussian.raw
% In readraw.m function: put Y = 320; X = 320; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Problem 2(b):    Denoising using bilateral filter
% Implementation  : Denoising using bilateral filter
% M-file name :   problem2_b.m 
% Output image :   Corn_denoised_bilateral.raw
% In readraw.m function: put Y = 320; X = 320; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 2(c):    Denoising using Non-Local Means filter
% Implementation  : NLM filter
% M-file name :   nlm_new.m
% M-file name (function file) : nlm.m
% Output image :  Corn_noisefree_nlm.raw
% In readraw.m function: put Y = 320; X = 320; 

% Source code taken from : https://github.com/NVlabs/SNN/tree/master/NLM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 2(d):    Denoising using Block Matching using 3D transform filter
% Implementation  : BM3D filter
% M-file name :   bm3d_new.m  		% Open this file in the BM3D folder
% Output image :   Corn_noisefree_bm3d.raw
% Output Image can be seen because of this command : imshow(y_est)
% In readraw.m function: put Y = 320; X = 320; 

% Source code taken from : http://www.cs.tut.fi/~foi/GCF-BM3D/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 2 :    PSNR values for Problem 2(a) and Problem 2(b)
% Implementation  : PSNR of linear, gaussian and bilateral filter
% M-file name :   psnr.m
% Output :   PSNR values in command window of MATLAB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
