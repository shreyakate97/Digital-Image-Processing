%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
G = readraw('Rose.raw');
rc = zeros(1,307200); gc = zeros(1,307200); bc = zeros(1,307200);

for i = 0: 307199
    rc(i+1) = G(3*i + 1);
    gc(i+1) = G(3*i + 2);
    bc(i+1) = G(3*i + 3);
end
 
c = 255*ones(1,307200) - rc; 
m = 255*ones(1,307200) - gc; 
y = 255*ones(1,307200) - bc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G = c;
F =[];
for i = 0:479
    out = G(1+(i*640):640+(i*640));
    F = [ F; out];
end
f = F;
T = 127; b = zeros(480,640);

h1 = (1/16)*[0 0 0; 0 0 7; 3 5 1];

for i = 2:1:479
    if mod(i,2) == 1
        for j = 2:639
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end

            e = f(i,j) - b(i,j);
            for k = -1:1
                for l = -1:1
                    f(i+k,j+l) = f(i+k,j+l) + h1(k+2,l+2)*e;
                end
            end
        end
    else
        for j = 639:-1:2
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end

            e = f(i,j) - b(i,j);
            for k = 1:-1:-1
                for l = 1:-1:-1
                    if i+k > 0 && j+l > 0 && i+k < 481 && j+l < 641
                    f(i+k,j+l) = f(i+k,j+l) + h1(k+2,2-l)*e;
                    end
                end
            end
        end
    end
end

C = b;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G = m;
F =[];
for i = 0:479
    out = G(1+(i*640):640+(i*640));
    F = [ F; out];
end
f = F;
T = 127; b = zeros(480,640);

h1 = (1/16)*[0 0 0; 0 0 7; 3 5 1];

for i = 2:479
    if mod(i,2) == 1
        for j = 2:639
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end

            e = f(i,j) - b(i,j);
            for k = -1:1
                for l = -1:1
                    f(i+k,j+l) = f(i+k,j+l) + h1(k+2,l+2)*e;
                end
            end
        end
    else
        for j = 639:-1:2
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end

            e = f(i,j) - b(i,j);
            for k = 1:-1:-1
                for l = 1:-1:-1
                    f(i+k,j+l) = f(i+k,j+l) + h1(k+2,2-l)*e;
                end
            end
        end
    end
end

M = b;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G = y;
F =[];
for i = 0:479
    out = G(1+(i*640):640+(i*640));
    F = [ F; out];
end
f = F;
T = 127; b = zeros(480,640);

h1 = (1/16)*[0 0 0; 0 0 7; 3 5 1];

for i = 2:479
    if mod(i,2) == 1
        for j = 2:639
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end

            e = f(i,j) - b(i,j);
            for k = -1:1
                for l = -1:1
                    f(i+k,j+l) = f(i+k,j+l) + h1(k+2,l+2)*e;
                end
            end
        end
    else
        for j = 639:-1:2
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end

            e = f(i,j) - b(i,j);
            for k = 1:-1:-1
                for l = 1:-1:-1
                    f(i+k,j+l) = f(i+k,j+l) + h1(k+2,2-l)*e;
                end
            end
        end
    end
end
Y = b;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R = 255*ones(480,640) - C; 
G = 255*ones(480,640) - M; 
B = 255*ones(480,640) - Y; 
out = zeros(480,640*3);
for i = 0:479
    for j = 0:639
        out(i+1, 3*j+1) =  R(i+1,j+1);
        out(i+1, 3*j+2) =  G(i+1,j+1);
        out(i+1, 3*j+3) =  B(i+1,j+1);
    end
end

count = writeraw(out,'color_halftoning_sep.raw');