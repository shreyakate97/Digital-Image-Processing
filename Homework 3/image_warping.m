G = readraw('raccoon.raw');
% separate rgb channels
Irc = []; Igc = [];Ibc = [];
for i = 0:262143
    rc(i+1) = G(3*i + 1);
    gc(i+1) = G(3*i + 2);
    bc(i+1) = G(3*i + 3);
end 
% converting to square matrix
for i = 0:511
    rcout = rc(1+(i*512):512+(i*512));
    Irc = [ Irc; rcout];
    gcout = gc(1+(i*512):512+(i*512));
    Igc = [ Igc; gcout];
    bcout = bc(1+(i*512):512+(i*512));
    Ibc = [ Ibc; bcout];
end
% % for bb8
% figure(1);
% r = cat(3,Irc/255,Igc/255,Ibc/255);
% imshow(r)

h = 512;
im_to_cart = [0 1 -0.5; -1 0 h+0.5; 0 0 1];
cart_to_im = [0 -1 h+0.5; 1 0 0.5; 0 0 1];
outR = zeros(512,512); outG = zeros(512,512); outB = zeros(512,512);
for row = 0:511
    for col = 0:511
        cartesian = im_to_cart*[row ;col; 1];
        new_x = (cartesian(1) - 512/2)/256;
        new_y = (cartesian(2) - 512/2)/256;
        
        if (new_x^2 + new_y^2) > 1
            continue;
        end
        
        transformed_x = 0.5*sqrt(2+(new_x)^2-(new_y)^2 + 2*sqrt(2)*new_x) - 0.5*sqrt(2+(new_x)^2-(new_y)^2-(2*sqrt(2))*new_x);
        transformed_y = 0.5*sqrt(2-(new_x)^2+(new_y)^2+(2*sqrt(2))*new_y) - 0.5*sqrt(2-(new_x)^2+(new_y)^2-(2*sqrt(2))*new_y);
        
        transformed_x = 256*transformed_x +256;
        transformed_y = 256*transformed_y +256;
        
        xy = cart_to_im*[transformed_x; transformed_y; 1];
        x = ceil(xy(1));
        y = ceil(xy(2));
        if x<0 || x>511 || y<0 || y>511
            continue;
        end
        outR(row+1,col+1) = Irc(x+1,y+1);
        outG(row+1,col+1) = Igc(x+1,y+1);
        outB(row+1,col+1) = Ibc(x+1,y+1);
    end
end

 for i = 0:511
    for j = 0:511
        out(i+1, 3*j+1) =  outR(i+1,j+1);
        out(i+1, 3*j+2) =  outG(i+1,j+1);
        out(i+1, 3*j+3) =  outB(i+1,j+1);
    end
 end
count = writeraw(out,'square2disk.raw');

% for bb8
% figure(2);
% r = cat(3,outR/255,outG/255,outB/255);
% imshow(r)
% disk to square
% separate rgb channels
G = readraw('square2disk.raw');
Irc = []; Igc = [];Ibc = [];
for i = 0:262143
    rc(i+1) = G(3*i + 1);
    gc(i+1) = G(3*i + 2);
    bc(i+1) = G(3*i + 3);
end 
% converting to square matrix
for i = 0:511
    rcout = rc(1+(i*512):512+(i*512));
    Irc = [ Irc; rcout];
    gcout = gc(1+(i*512):512+(i*512));
    Igc = [ Igc; gcout];
    bcout = bc(1+(i*512):512+(i*512));
    Ibc = [ Ibc; bcout];
end
outR = zeros(512,512); outG = zeros(512,512); outB = zeros(512,512);

for row = 0:511
    for col = 0:511
        cartesian = im_to_cart*[row ;col; 1];
        new_x = (cartesian(1) - 512/2)/256;
        new_y = (cartesian(2) - 512/2)/256;
        
        transformed_x = new_x*sqrt(1-((new_y)^2)/2);
        transformed_y = new_y*sqrt(1-((new_x)^2)/2);
        
        transformed_x = 256*transformed_x +256;
        transformed_y = 256*transformed_y +256;
        
        xy = cart_to_im*[transformed_x; transformed_y; 1];
        x = ceil(xy(1));
        y = ceil(xy(2));
        if x<0 || x>511 || y<0 || y>511
            continue;
        end
        outR(row+1,col+1) = Irc(x+1,y+1);
        outG(row+1,col+1) = Igc(x+1,y+1);
        outB(row+1,col+1) = Ibc(x+1,y+1);
    end
end

 for i = 0:511
    for j = 0:511
        out(i+1, 3*j+1) =  outR(i+1,j+1);
        out(i+1, 3*j+2) =  outG(i+1,j+1);
        out(i+1, 3*j+3) =  outB(i+1,j+1);
    end
 end
count = writeraw(out,'disk2square.raw');
% % for bb8
% figure(3);
% r = cat(3,outR/255,outG/255,outB/255);
% imshow(r)