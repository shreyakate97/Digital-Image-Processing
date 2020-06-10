G = readraw('GearTooth.raw');
row=250; col=250;
I = [];
for i = 0:(row-1)
    out = G(1+(i*col):col+(i*col));
     I= [ I; out];
end
for i = 1:row
    for j = 1:col
        if I(i,j) >127
            I1(i,j) = 0;
        else
            I1(i,j) = 1;
        end
    end
end
figure(1);imshow(I1) % image reversed

F1 = bwmorph(I1,'shrink',Inf);
figure(2);
imshow(F1)
c = [0 0 0 0 1 0 0 0 0];
C = zeros(row,col);
for i = 1:row
    for j = 1:col
        if F1(i,j) == 1
        f = [F1(i-1,j-1), F1(i-1,j), F1(i-1,j+1), F1(i,j-1), F1(i,j), F1(i,j+1), F1(i+1,j-1), F1(i+1,j), F1(i+1,j+1)];
            if isequal(f,c)
                C(i,j)=1;
            else
                C(i,j)=0;
            end
        end
    end
end
% find and display the centres of 4 black circle holes
figure(3);; imshow(C)

G = readraw('GearTooth.raw');
row=250; col=250;
I = [];
for i = 0:(row-1)
    out = G(1+(i*col):col+(i*col));
     I= [ I; out];
end

for i = 1:row
    for j = 1:col
        if I(i,j) >127
            I2(i,j) = 1;
        else
            I2(i,j) = 0;
        end
    end
end
figure(4);imshow(I2) % image as it was

F2 = bwmorph(I2,'shrink',Inf);
figure(5)
imshow(F2)

c = [0 1 0 1 1 1 0 1 0];
D = zeros(row,col);
for i = 1:row
    for j = 1:col
        if F2(i,j) == 1
        f = [F2(i-1,j-1), F2(i-1,j), F2(i-1,j+1), F2(i,j-1), F2(i,j), F2(i,j+1), F2(i+1,j-1), F2(i+1,j), F2(i+1,j+1)];
            if isequal(f,c)
                D(i,j)=1;
            else
                D(i,j)=0;
            end
        end
    end
end
figure(6); imshow(D)    
R = I1+D;
figure(7);imshow(R)
count = writeraw(255*R,'1.raw')
radius = 0;
for i = 125:250
    if R(i,126) == 0
        radius = radius +1;
    else
        disp('radius =');disp(radius);
    end
end

r = radius-6; theta = 0;
centrex = 125; centrey = 126;
Z = zeros(250,250);
for i = 1:12
    x = abs(round(r*cos(theta)));
    y = abs(round(r*sin(theta)));
    theta = theta + (pi/6);
    if i<=7
        y = centrey - y;
    else
        y = centrey + y;
    end
    if i<4 || i>=10
        x = centrex+x;
    else
        x = centrex-x;
    end
    Z(x,y) = 1; Z(x-1,y-1)=1; Z(x-1,y+1)=1;
    Z(x+1,y-1)=1; Z(x+1,y+1)=1;
    I2(x,y) = 1; I2(x-1,y-1)=1; I2(x-1,y+1)=1;
    I2(x+1,y-1)=1; I2(x+1,y+1)=1;
end
figure(8);
imshow(Z);
figure(9)
imshow(I2)




        
        
        
        
        
        
        
        