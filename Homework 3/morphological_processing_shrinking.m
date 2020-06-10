I = readraw('cup.raw');
% row=558; col=558; %fan.raw and maze.raw
row = 356; col=315; %cup.raw
F = [];
for i = 0:(row-1)
    out = I(1+(i*col):col+(i*col));
    F = [ F; out];
end
for i = 1:row
    for j = 1:col
        if F(i,j) >127
            F(i,j) = 1;
        else
            F(i,j) = 0;
        end
    end
end
imshow(F)
shrinking_conditional = [1 0 0 0 1 0 0 0 0; 0 1 0 0 1 0 0 0 0;0 0 1 0 1 0 0 0 0; 0 0 0 1 1 0 0 0 0; %s1
    0 0 0 0 1 1 0 0 0; 0 0 0 0 1 0 1 0 0; 0 0 0 0 1 0 0 1 0; 0 0 0 0 1 0 0 0 1; %s2
    0 0 1 0 1 1 0 0 0; 0 1 1 0 1 0 0 0 0; 1 1 0 0 1 0 0 0 0; 1 0 0 1 1 0 0 0 0; %s3
    0 0 0 1 1 0 1 0 0; 0 0 0 0 1 0 1 1 0; 0 0 0 0 1 0 0 1 1; 0 0 0 0 1 1 0 0 1; %s3
    0 0 1 0 1 1 0 0 1;1 1 1 0 1 0 0 0 0; 1 0 0 1 1 0 1 0 0; 0 0 0 0 1 0 1 1 1; %stk4
    1 1 0 0 1 1 0 0 0; 0 1 0 0 1 1 0 0 1; 0 1 1 1 1 0 0 0 0; 0 0 1 0 1 1 0 1 0; %st5
    0 1 1 0 1 1 0 0 0; 1 1 0 1 1 0 0 0 0; 0 0 0 1 1 0 1 1 0; 0 0 0 0 1 1 0 1 1; %st5
    1 1 0 0 1 1 0 0 1; 0 1 1 1 1 0 1 0 0;                                       %st6
    1 1 1 0 1 1 0 0 0; 0 1 1 0 1 1 0 0 1; 1 1 1 1 1 0 0 0 0; 1 1 0 1 1 0 1 0 0; %stk6
    1 0 0 1 1 0 1 1 0; 0 0 0 1 1 0 1 1 1; 0 0 0 0 1 1 1 1 1; 0 0 1 0 1 1 0 1 1; %stk6
    1 1 1 0 1 1 0 0 1; 1 1 1 1 1 0 1 0 0; 1 0 0 1 1 0 1 1 1; 0 0 1 0 1 1 1 1 1; %stk7
    0 1 1 0 1 1 0 1 1; 1 1 1 1 1 1 0 0 0; 1 1 0 1 1 0 1 1 0; 0 0 0 1 1 1 1 1 1; %stk8
   1 1 1 0 1 1 0 1 1; 0 1 1 0 1 1 1 1 1; 1 1 1 1 1 1 1 0 0; 1 1 1 1 1 1 0 0 1; %stk9
   1 1 1 1 1 0 1 1 0; 1 1 0 1 1 0 1 1 1; 1 0 0 1 1 1 1 1 1; 0 0 1 1 1 1 1 1 1; %stk 9
    1 1 1 0 1 1 1 1 1; 1 1 1 1 1 1 1 0 1; 1 1 1 1 1 0 1 1 1; 1 0 1 1 1 1 1 1 1]; %stk10
thinning_conditional = [ 0 1 0 0 1 1 0 0 0; 0 1 0 1 1 0 0 0 0; 0 0 0 1 1 0 0 1 0; 0 0 0 0 1 1 0 1 0; %tk
0 0 1 0 1 1 0 0 1;1 1 1 0 1 0 0 0 0; 1 0 0 1 1 0 1 0 0; 0 0 0 0 1 0 1 1 1; %stk4
    1 1 0 0 1 1 0 0 0; 0 1 0 0 1 1 0 0 1; 0 1 1 1 1 0 0 0 0; 0 0 1 0 1 1 0 1 0; %st5
    0 1 1 0 1 1 0 0 0; 1 1 0 1 1 0 0 0 0; 0 0 0 1 1 0 1 1 0; 0 0 0 0 1 1 0 1 1; %st5
    1 1 0 0 1 1 0 0 1; 0 1 1 1 1 0 1 0 0;                                       %st6
    1 1 1 0 1 1 0 0 0; 0 1 1 0 1 1 0 0 1; 1 1 1 1 1 0 0 0 0; 1 1 0 1 1 0 1 0 0; %stk6
    1 0 0 1 1 0 1 1 0; 0 0 0 1 1 0 1 1 1; 0 0 0 0 1 1 1 1 1; 0 0 1 0 1 1 0 1 1; %stk6
    1 1 1 0 1 1 0 0 1; 1 1 1 1 1 0 1 0 0; 1 0 0 1 1 0 1 1 1; 0 0 1 0 1 1 1 1 1; %stk7
    0 1 1 0 1 1 0 1 1; 1 1 1 1 1 1 0 0 0; 1 1 0 1 1 0 1 1 0; 0 0 0 1 1 1 1 1 1; %stk8
   1 1 1 0 1 1 0 1 1; 0 1 1 0 1 1 1 1 1; 1 1 1 1 1 1 1 0 0; 1 1 1 1 1 1 0 0 1; %stk9
   1 1 1 1 1 0 1 1 0; 1 1 0 1 1 0 1 1 1; 1 0 0 1 1 1 1 1 1; 0 0 1 1 1 1 1 1 1; %stk 9
    1 1 1 0 1 1 1 1 1; 1 1 1 1 1 1 1 0 1; 1 1 1 1 1 0 1 1 1; 1 0 1 1 1 1 1 1 1]; %stk10
k_conditional = [ 0 1 0 0 1 1 0 0 0; 0 1 0 1 1 0 0 0 0; 0 0 0 1 1 0 0 1 0; 0 0 0 0 1 1 0 1 0; %tk
        0 0 1 0 1 1 0 0 1;1 1 1 0 1 0 0 0 0; 1 0 0 1 1 0 1 0 0; 0 0 0 0 1 0 1 1 1; %stk4
    1 1 0 0 1 1 0 0 0; 0 1 0 0 1 1 0 0 1; 0 1 1 1 1 0 0 0 0; 0 0 1 0 1 1 0 1 0; %st5
    0 1 1 0 1 1 0 0 0; 1 1 0 1 1 0 0 0 0; 0 0 0 1 1 0 1 1 0; 0 0 0 0 1 1 0 1 1; %st5
    1 1 0 0 1 1 0 0 1; 0 1 1 1 1 0 1 0 0;                                       %st6
    1 1 1 0 1 1 0 0 0; 0 1 1 0 1 1 0 0 1; 1 1 1 1 1 0 0 0 0; 1 1 0 1 1 0 1 0 0; %stk6
    1 0 0 1 1 0 1 1 0; 0 0 0 1 1 0 1 1 1; 0 0 0 0 1 1 1 1 1; 0 0 1 0 1 1 0 1 1; %stk6
    1 1 1 0 1 1 0 0 1; 1 1 1 1 1 0 1 0 0; 1 0 0 1 1 0 1 1 1; 0 0 1 0 1 1 1 1 1; %stk7
    0 1 1 0 1 1 0 1 1; 1 1 1 1 1 1 0 0 0; 1 1 0 1 1 0 1 1 0; 0 0 0 1 1 1 1 1 1; %stk8
   1 1 1 0 1 1 0 1 1; 0 1 1 0 1 1 1 1 1; 1 1 1 1 1 1 1 0 0; 1 1 1 1 1 1 0 0 1; %stk9
   1 1 1 1 1 0 1 1 0; 1 1 0 1 1 0 1 1 1; 1 0 0 1 1 1 1 1 1; 0 0 1 1 1 1 1 1 1; %stk 9
    1 1 1 0 1 1 1 1 1; 1 1 1 1 1 1 1 0 1; 1 1 1 1 1 0 1 1 1; 1 0 1 1 1 1 1 1 1; %stk10
    1 1 1 1 1 1 0 1 1; 1 1 1 1 1 1 1 1 0; 1 1 0 1 1 1 1 1 1; 0 1 1 1 1 1 1 1 1]; %k

C = zeros(row,col);
G = zeros(row,col);
C = F;
flag = true;
itr = 0;
while(flag==true)
    temp = G;
    for i = 2:(row-1)
        for j = 2:(col-1)
            if F(i,j) == 0
                C(i,j) = 0;
                continue;
            elseif F(i,j) == 1
                f = [F(i-1,j-1), F(i-1,j), F(i-1,j+1), F(i,j-1), F(i,j), F(i,j+1), F(i+1,j-1), F(i+1,j), F(i+1,j+1)];
                    for k = 1: length(shrinking_conditional)
                        if f==shrinking_conditional(k,:)
                            C(i,j) = 1;
                            break;
                        end
                    end
            end  
        end
    end
    
    for i = 2:(row-1)
        for j = 2:(col-1)
            if C(i,j) == 1
                G(i,j) = ST_unconditional(F(i,j),C(i,j),C(i-1,j-1),C(i-1,j),C(i-1,j+1),C(i,j-1),C(i,j+1),C(i+1,j-1),C(i+1,j),C(i+1,j+1));
                if G(i,j) == 1
                    G(i,j) = F(i,j);
                end
            end
        end
    end  
    imshow(G); figure;
if(isequal(temp,G))
  flag=false;
end
F=G;
C=zeros(row,col);
itr=itr+1;
end
disp(itr)
G=255*G;
count = writeraw(G,'1.raw');