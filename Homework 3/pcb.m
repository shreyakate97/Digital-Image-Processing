G = readraw('PCB.raw');

F = [];
for i = 0:238
    out = G(1+(i*372):372+(i*372));
    F = [ F; out];
end
G1 = zeros(239,372);
G2 = zeros(239,372);
for i = 1:239
    for j = 1:372
        if F(i,j) >127
            G1(i,j) = 1;
        else
            G1(i,j) = 0;
        end
    end
end
imshow(G1)
figure;


C = bwmorph(G1,'shrink',Inf);
imshow(C)

c=-1;
for i = 2:237
    for j = 2:371
        if C(i,j)==1
            f = [C(i-1,j-1), C(i-1,j), C(i-1,j+1), C(i,j-1), C(i,j), C(i,j+1), C(i+1,j-1), C(i+1,j), C(i+1,j+1)];
            if f == [0 0 0 0 1 0 0 0 0]
                c = c+1;
            end
        end
    end
end
disp('number of holes');
disp(c)
for i = 1:239
    for j = 1:372
        if F(i,j) >127
            G2(i,j) = 0;
        else
            G2(i,j) = 1;
        end
    end
end
% C = bwmorph(G2,'shrink',Inf);

%imshow(G2)
figure;
G2 = bwmorph(G2,'shrink',Inf);
imshow(G2);

CC = bwconncomp(G2);
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = min(numPixels);

G3 = G2;
for i = 1:24
    if numPixels(i) <30
        G3(CC.PixelIdxList{i}) = 0;
    end
end
figure
imshow(G3)
title('Final Image');



G4 = G2;
for i = 1:24
    if numPixels(i)>30
        G4(CC.PixelIdxList{i}) = 0;
    end
end
figure
imshow(G4)
title('Small circles removed');

G5 = G2;
for i = 1:24
    if numPixels(i)<1000
        G5(CC.PixelIdxList{i}) = 0;
    end
end
figure
imshow(G5)
title('Bigest part counted as 1 component');

G6 = G2;
for i = 1:24
    if numPixels(i)<500 || numPixels(i)>1000
        G6(CC.PixelIdxList{i}) = 0;
    end
end
figure
imshow(G6)
title('2nd Bigest part counted as 1 component');

CC = bwconncomp(G3);
disp("Number of Connected Components: ");
disp(CC.NumObjects);
