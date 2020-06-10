%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: January 28, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
G = readraw('Dog.raw');
alpha = 1/2; beta = 5/8; gamma = 3/4;
out1 = [];
imagematrix = [];
out2 = [];
temp = [];
for i = 0:531
    out = G(1+(i*600):600+(i*600));
    imagematrix = [ imagematrix; out];
end
% add extra columns and rows
out1(:,1) = imagematrix(:,2);
out1(:,2) = imagematrix(:,1);
out1(:,3:602) = imagematrix(:,1:600);
out1(:,603) = out1(:,602);
out1(:,604) = out1(:,601);

out1(3:534,:) = out1(:,:);
out1(1,:) = out1(4,:);
out1(2,:) = out1(3,:);
out1(535,:) = out1(534,:);
out1(536,:) = out1(533,:);

for i = 3:534
    temp = [];
    for j = 3:602
        % green centre
        if (mod(i,2) == 0 );
            if (mod(j,2) == 0);
              % green formula (blue row, red column) 
              delta1 = 5*out1(i,j) - out1(i-1,j-1) - out1(i-1,j+1) - out1(i+1,j-1) - out1(i+1,j+1) + 0.5*(out1(i-2,j)+ out1(i+2,j)) - out1(i,j-2) - out1(i,j+2);
              delta2 = 5*out1(i,j) - out1(i-1,j-1) - out1(i-1,j+1) - out1(i+1,j-1) - out1(i+1,j+1) + 0.5*(out1(i,j-2)+ out1(i,j+2)) - out1(i-2,j) - out1(i+2,j);
              g = out1(i,j);
              b = 0.5*(out1(i,j-1)+out1(i,j+1));   
              b = b + beta*delta1;
              r = 0.5*(out1(i-1,j)+out1(i+1,j));
              r = r + beta*delta2;
            else
               % blue formula
               b = out1(i,j);
               delta = out1(i,j) - 0.25*(out1(i-2,j) + out1(i+2,j) + out1(i,j-2) + out1(i,j+2));
               g = 0.25*(out1(i,j-1) + out1(i-1,j) + out1(i,j+1) + out1(i+1,j));
               g = g + gamma*delta;
               r = 0.25*(out1(i-1,j-1) + out1(i-1,j+1) + out1(i+1,j-1) + out1(i+1,j+1));
               r = r + gamma*delta;
            end
        else
            if (mod(j,2) ~= 0);
                %green formula (red row, blue column)
                 g = out1(i,j);
                 delta1 = 5*out1(i,j) - out1(i-1,j-1) - out1(i-1,j+1) - out1(i+1,j-1) - out1(i+1,j+1) + 0.5*(out1(i-2,j)+ out1(i+2,j)) - out1(i,j-2) - out1(i,j+2);
                 delta2 = 5*out1(i,j) - out1(i-1,j-1) - out1(i-1,j+1) - out1(i+1,j-1) - out1(i+1,j+1) + 0.5*(out1(i,j-2)+ out1(i,j+2)) - out1(i-2,j) - out1(i+2,j);
                 r = 0.5*(out1(i,j-1)+out1(i,j+1));
                 r = r + beta*delta1;
                 b = 0.5*(out1(i-1,j)+out1(i+1,j));
                 b = b + beta*delta2;
            else
            %red formula
                r = out1(i,j);
                delta = out1(i,j) - 0.25*(out1(i-2,j) + out1(i+2,j) + out1(i,j-2) + out1(i,j+2));
                g = 0.25*(out1(i,j-1) + out1(i-1,j) + out1(i,j+1) + out1(i+1,j));
                g = g + alpha*delta;
                b = 0.25*(out1(i-1,j-1) + out1(i-1,j+1) + out1(i+1,j-1) + out1(i+1,j+1));
                b = b + alpha*delta;
            end
   
        end
        temp = [temp r g b];
    end
    out2 = [out2 temp];
end

count = writeraw(out2, 'Dog2.raw');