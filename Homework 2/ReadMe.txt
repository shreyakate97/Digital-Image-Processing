% EE569 Homework Assignment #2
% Submission Date: February 16, 2020 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 1(a):    Sobel Edge Detector
% Implementation : Sobel Edge Detection
% M-file name:     sobel_edge_detector.m 
% Output images:   gxout.raw
		   gyout.raw
		   magnitude.raw
		   norm.raw

%In readraw.m function: put Y = 481; X = 321;
%In line 7 read Dogs.raw or Gallery.raw

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 1(b):    Canny Edge Detector
% Implementation : Canny Edge Detection
% M-file name:     canny_jpg.m 
% Output image:    BW1   % it is displayed using imshow()

%In line 7 read Dogs.jpg or Gallery.jpg

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 1(c):    Structured Edge Detector
% Implementation : SE detector using Random Forest Algorithm
%% (Use Matlab 2016b for this code)
% M-file name:     edgesDemo.m  in edges-master folder       
% Output image 1:   E % used imshow() to display the output image

% In line 24 add the path of the image whose edges are to be detected (Helicopter.raw, Dogs.raw or Gallery.raw)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 1(d):    Performance Evaluation
% Implementation : Precision, Recall and F-measure of Sobel, Canny and SE
%% (Use Matlab 2016b for this code)
% M-file name:      evaluation_sobel.m
		    evaluation_canny.m
                    evaluation_se.m  (in edges-master folder)       
%% (Use Matlab 2016b for this code)

% Output image 1:   E % used imshow() to display the output image

% For Sobel, Canny and SE, make the appropriate changes in reading the images in sobel_edge_detector.m, canny_jpg.m and edgesDemo.m
% Read the corresponding GroundTruth files for the Dogs and Gallery images in lines 10 and 12 of the 3 evaluation files mentioned above

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 2(a):       Dithering
% Implementation 1:   Using fixed thresholding
% M-file name 1:      dithering_fixed.m 
% Output image 1:     fixed_thresholding_output.raw

% Implementation 2:  Using random thresholding
% M-file name 2:     dithering_random.m 
% Output image 2:    random_thresholding_output.raw

% Implementation 3 : Using dithering matrices (I2, I8, I32)
% M-file name 3:     dithering_matrix.m 
% Output images :    dithering_matrix_output_I2.raw
                     dithering_matrix_output_I8.raw
                     dithering_matrix_output_I32.raw

% In readraw.m function: put Y = 750; X = 500; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 2(b):    Error Diffusion
% Implementation:  Floyd-Steinberg, JJN, Stucki and suggested idea
% M-file name :    problem2b.m 
% Output images :   error_diff_1.raw
                    error_diff_2.raw
                    error_diff_3.raw
                    error_diff_4.raw

% In readraw.m function: put Y = 750; X = 500; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Problem 2(c):    Color Halftoning with error diffusion
% Implementation 1 : Separable Error Diffusion
% M-file name :   color_halftoning.m
% Output image :  color_halftoning_sep.raw

% Implementation 2 : MBVQ-based Error Diffusion
% M-file name :      color_halftoning_mbvq.m
% related function files: getmbvq.m
			  getvertex.m
		          getNearestVertex.m
% Output image :     color_halftoning_mbvq.raw

% In readraw.m function: put Y = 640; X = 480; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
