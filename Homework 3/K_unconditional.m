%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: March 3, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function G = K_unconditional(F,C,C0,C1,C2,C3,C4,C5,C6,C7)
%skeletonizing unconditional mark pattern
%spur
if (C+C7) == 2 && (C0+C1+C2+C3+C4+C5+C6)==0
    G=1;
elseif (C+C5)==2 && (C0+C1+C2+C3+C4+C6+C7)==0
    G=1;
elseif (C+C2)==2 && (C0+C1+C3+C4+C5+C6+C7)==0
    G=1;
elseif (C+C0)==2 && (C1+C2+C3+C4+C5+C6+C7) ==0
    G=1;
% single 4-connection
elseif (C+C6)==2 && (C0+C1+C2+C3+C4+C5+C7)==0
    G=1;
elseif (C+C3)==2 && (C0+C1+C2+C4+C5+C6+C7)==0
    G=1;
elseif (C+C4)==2 && (C0+C1+C2+C3+C5+C6+C7)==0
    G=1;
elseif (C+C1)==2 && (C0+C2+C3+C4+C5+C6+C7)==0
    G=1;
    % L corner
elseif (C+C1+C4)==2 && (C0+C2+C3+C5+C6+C7)==0
    G=1;
elseif (C+C1+C3)==2 && (C0+C2+C4+C5+C6+C7)==0
    G=1;
elseif (C+C6+C4)==2 && (C0+C1+C2+C3+C5+C7)==0
    G=1;
elseif (C+C6+C3)==2 && (C0+C1+C2+C4+C5+C7)==0
    G=1;
%corner cluster
elseif (C+C0 +C1 +C3 )==4 && (C1+C4+C5+C6+C7)>=0 && (C1+C4+C5+C6+C7)<=5
   G=1;
elseif (C+C4 +C6 +C7)==4 && (C0+C1+C2+C3+C5)>=0 && (C0+C1+C2+C3+C5)<=5
   G=1;
% tee branch
elseif (C1+C3+C4+C)==4 && (C0+C2+C5+C6+C7)>=0 && (C0+C2+C5+C6+C7)<=5
    G=1;
elseif (C1+C3+C+C6)==4 && (C0+C2+C4+C5+C7)>=0 && (C0+C2+C4+C5+C7)<=5
    G =1;
elseif (C3+C4+C6+C)==4 && (C0+C1+C2+C5+C7)>=0 && (C0+C1+C2+C5+C7)<=5
    G =1;
elseif (C1+C+C4+C6)==4 && (C0+C2+C3+C5+C7)>=0 && (C0+C2+C3+C5+C7)<=5
    G =1;
% vee branch
elseif (C0+C2+C) == 3 && (C5+C6+C7)>=1 && (C5+C6+C7)<=3 && (C1+C3+C4)>=0
   G=1;
elseif (C0+C+C5) ==3 && (C2+C4+C7)>=1 && (C2+C4+C7)<=3 && (C1+C3+C6)>=0
    G=1;
elseif (C+C5+C7) ==3 && (C0+C1+C2)>=1 && (C0+C1+C2)<=3 && (C3+C4+C6)>=0
    G=1;
elseif (C2+C+C7) ==3 && (C0+C3+C5)>=1 && (C0+C3+C5)<=3 && (C2+C4+C6)>=0
    G=1;
    % diagonal branch
elseif (C+C1+C4+C5)==4 && (C2+C3+C6)==0 && (C0+C7)>=0
    G=1;
elseif (C+C1+C3+C7)==4 && (C0+C4+C6)==0 && (C2+C5)>=0
   G=1;
elseif (C2+C3+C+C6)==4 && (C1+C4+C5)==0 && (C0+C7)>=0
    G=1;
elseif (C+C0+C4+C6)==4 && (C1+C3+C7)==0 && (C2+C5)>=0
    G=1;
else
    G=0;
end  
end

