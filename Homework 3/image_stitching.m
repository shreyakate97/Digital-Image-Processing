left = readraw('left.raw');
middle = readraw('middle.raw');
right = readraw('right.raw');
row = 720; col = 480;
% separate rgb channels
Irc = []; Igc = [];Ibc = []; Irc1 = []; Igc1 = [];Ibc1 = []; 
Irc2 = []; Igc2 = [];Ibc2 = [];
for i = 0:(row*col -1)
    rc(i+1) = left(3*i + 1);
    gc(i+1) = left(3*i + 2);
    bc(i+1) = left(3*i + 3);
    
    rc1(i+1) = middle(3*i + 1);
    gc1(i+1) = middle(3*i + 2);
    bc1(i+1) = middle(3*i + 3);
    
    rc2(i+1) = right(3*i + 1);
    gc2(i+1) = right(3*i + 2);
    bc2(i+1) = right(3*i + 3);
end 
% converting to square matrix
for i = 0:(row-1)
    rcout = rc(1+(i*col):col+(i*col));
    Irc = [ Irc; rcout/255];
    gcout = gc(1+(i*col):col+(i*col));
    Igc = [ Igc; gcout/255];
    bcout = bc(1+(i*col):col+(i*col));
    Ibc = [ Ibc; bcout/255];
    
    rcout1 = rc1(1+(i*col):col+(i*col));
    Irc1 = [ Irc1; rcout1/255];
    gcout1 = gc1(1+(i*col):col+(i*col));
    Igc1 = [ Igc1; gcout1/255];
    bcout1 = bc1(1+(i*col):col+(i*col));
    Ibc1 = [ Ibc1; bcout1/255];
    
    rcout2 = rc2(1+(i*col):col+(i*col));
    Irc2 = [ Irc2; rcout2/255];
    gcout2 = gc2(1+(i*col):col+(i*col));
    Igc2 = [ Igc2; gcout2/255];
    bcout2 = bc2(1+(i*col):col+(i*col));
    Ibc2 = [ Ibc2; bcout2/255];
end
%detect control points
out = detect_control_points(Irc, Igc, Ibc, Irc1, Igc1, Ibc1)

canvasr = zeros(1300,1200); canvasg = zeros(1300,1200); canvasb = zeros(1300,1200);
%left image points
X1=  272; Y1 = 373;
X2 = 262; Y2 = 395;
X3= 320; Y3= 378;
X4 = 347; Y4 = 390;

%middle image points
x1 = 121; 
y1 = 376;
x2 = 110; 
y2 = 401;
x3 = 170; 
y3 = 378;
x4 = 198; 
y4 = 389;
A =[x1 y1 1 0 0 0 -x1*X1 -y1*Y1; 
    0 0 0 x1 y1 1 -x1*X1 -y1*Y1;
    x2 y2 1 0 0 0 -x2*X2 -y2*Y2; 
    0 0 0 x2 y2 1 -x2*X2 -y2*Y2;
    x3 y3 1 0 0 0 -x3*X3 -y3*Y3; 
    0 0 0 x3 y3 1 -x3*X3 -y3*Y3;
    x4 y4 1 0 0 0 -x4*X4 -y4*Y4; 
    0 0 0 x4 y4 1 -x4*X4 -y4*Y4];
H1 = pinv(A)*[X1; Y1; X2; Y2; X3; Y3; X4; Y4];
H = [H1(1:3)'; H1(4:6)'; H1(7:8)' 1];

X =zeros(720,480); Y=zeros(720,480);
for i =1:720
    for j = 1:480
        answer = H*[i; j; 1];
        x = floor(answer(1)/answer(3));
        y = floor(answer(2)/answer(3))+63;
        X(i,j) = x;
        Y(i,j) = y;
       
      canvasr(x+10,y) = Irc(i,j);
      canvasg(x+10,y) = Igc(i,j);
      canvasb(x+10,y) = Ibc(i,j);
% %       canvas(i+170,j+250) = Irc1(i,j);
      
    end
end

for i =1:720
    for j = 1:480
        if canvasr(i+150,j+230) > 0 && j>230
            canvasr(i+150,j+230)= (canvasr(i+150,j+230)+Irc1(i,j))/2;
        elseif canvasr(i+150,j+230)==0
            canvasr(i+150,j+230) = Irc1(i,j);
        end
        if canvasg(i+150,j+230) > 0 && j>230
            canvasg(i+150,j+230)= (canvasg(i+150,j+230)+Igc1(i,j))/2;
        elseif canvasg(i+150,j+230)==0
            canvasg(i+150,j+230) = Igc1(i,j);
        end
        if canvasb(i+150,j+230) > 0 && j>230
            canvasb(i+150,j+230)= (canvasb(i+150,j+230)+Ibc1(i,j))/2;
        elseif canvasb(i+150,j+230)==0
            canvasb(i+150,j+230) = Ibc1(i,j);
        end
    end
end

figure; imshow(canvas)

out = detect_control_points(Irc1, Igc1, Ibc1, Irc2,Igc2,Ibc2)
% middle image points
x1= 226;  y1 = 377;
x2 = 234; y2 = 426;
x3= 357; y3= 286;
x4 = 358; y4 = 301;

%right image points
X1 = 67; Y1 = 383;
X2 = 79; Y2 = 437;
X3 = 204; Y3 = 289;
X4 = 205; Y4 = 303;
A =[x1 y1 1 0 0 0 -x1*X1 -y1*Y1; 
    0 0 0 x1 y1 1 -x1*X1 -y1*Y1;
    x2 y2 1 0 0 0 -x2*X2 -y2*Y2; 
    0 0 0 x2 y2 1 -x2*X2 -y2*Y2;
    x3 y3 1 0 0 0 -x3*X3 -y3*Y3; 
    0 0 0 x3 y3 1 -x3*X3 -y3*Y3;
    x4 y4 1 0 0 0 -x4*X4 -y4*Y4; 
    0 0 0 x4 y4 1 -x4*X4 -y4*Y4];
H1 = pinv(A)*[X1; Y1; X2; Y2; X3; Y3; X4; Y4];
H = [H1(1:3)'; H1(4:6)'; H1(7:8)' 1];

X =zeros(720,480); Y=zeros(720,480);
for i =1:720
    for j = 1:480
        answer = H*[i; j; 1];
        x = floor(answer(1)/answer(3))+298;
        y = floor(answer(2)/answer(3))+75;
        X(i,j) = x;
        Y(i,j) = y;
        if j>240
            canvasr(x,y+300) = (canvasr(x,y+300)+Irc2(i,j))/2;
            canvasg(x,y+300) = (canvasg(x,y+300)+Igc2(i,j))/2;
            canvasb(x,y+300) = (canvasb(x,y+300)+Ibc2(i,j))/2;
        end
    end
end
image = cat(3,canvasr,canvasg,canvasb);
disp(min(min(X))); disp(min(min(Y)));
figure; imshow(image)