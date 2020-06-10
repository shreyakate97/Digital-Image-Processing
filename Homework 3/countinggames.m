I = readraw('stars.raw');
row=480; col=640;
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
stars = 0;
sizes = [];
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
    imshow(G)
if(isequal(temp,G))
  flag=false;
end
F=G;
C=zeros(row,col);
itr=itr+1;

c=0;
for i = 2:479
    for j = 2:639
        if G(i,j)==1
            f = [G(i-1,j-1), G(i-1,j), G(i-1,j+1), G(i,j-1), G(i,j), G(i,j+1), G(i+1,j-1), G(i+1,j), G(i+1,j+1)];
            if f == [0 0 0 0 1 0 0 0 0]
                c = c+1;
            end
        end
    end
end
% if (c-stars)>0
    sizes = [sizes; 2*itr c-stars];
% end
    
stars = c;
end
disp(2*itr)
G=255*G;
count = writeraw(G,'1.raw');

c=0;
for i = 2:479
    for j = 2:639
        if G(i,j)==255
            f = [G(i-1,j-1), G(i-1,j), G(i-1,j+1), G(i,j-1), G(i,j), G(i,j+1), G(i+1,j-1), G(i+1,j), G(i+1,j+1)];
            if f == [0 0 0 0 255 0 0 0 0]
                c = c+1;
            end
        end
    end
end

disp('number of stars:'); disp(c)
figure;

hb = bar(sizes(:,1),sizes(:,2),'hist');
xlabel('size of stars')
ylabel('frequency')
set(hb,'FaceColor','cyan');