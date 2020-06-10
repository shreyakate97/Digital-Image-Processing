%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: March 3, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function out = detect_control_points(Irc1, Igc1, Ibc1, Irc2,Igc2,Ibc2)
I1 = rgb2gray(cat(3,Irc1,Igc1,Ibc1));
I2 = rgb2gray(cat(3,Irc2,Igc2,Ibc2));

points1 = detectSURFFeatures(I1);
points2 = detectSURFFeatures(I2);

[f1,vpts1] = extractFeatures(I1,points1);
[f2,vpts2] = extractFeatures(I2,points2);

indexPairs = matchFeatures(f1,f2,'MatchThreshold',1) ;
matchedPoints1 = vpts1(indexPairs(1:10,1));
matchedPoints2 = vpts2(indexPairs(1:10,2));

figure; out = showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2,'montage');
legend('matched points 1','matched points 2');

end

