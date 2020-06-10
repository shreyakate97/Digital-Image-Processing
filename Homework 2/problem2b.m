%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
G = readraw('LightHouse.raw');
F =[];
for i = 0:499
    out = G(1+(i*750):750+(i*750));
    F = [ F; out];
end

f = F;
T = 127; b = zeros(500,750);

h1 = (1/16)*[0 0 0; 0 0 7; 3 5 1];
h2 = (1/48)*[0 0 0 0 0;0 0 0 0 0; 0 0 0 7 5;3 5 7 5 3; 1 3 5 3 1];
h3 = (1/42)*[0 0 0 0 0;0 0 0 0 0; 0 0 0 8 4; 2 4 8 4 2; 1 2 4 2 1];
h4 = (1/144)*[0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 11 9 7; 5 7 9 11 9 7 5; 3 5 7 9 7 5 3; 1 3 5 7 5 3 1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% errordiff_1
for i = 2:499
    if mod(i,2) == 1
        for j = 2:749
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end
            e = f(i,j) - b(i,j);
            
            for k = 0:1
                for l = -1:1:1
%                     if i+k > 0 && j+l > 0 && i+k < 501 && j+l < 751
                        f(i+k,j+l) = f(i+k,j+l) + h1(k+2,l+2)*e;
%                     end
                end
            end
        end
    else
        for j = 749:-1:2
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end
            e = f(i,j) - b(i,j);
            for k = 1:-1:0
                for l = 1:-2:-1
%                     if i+k > 0 && j+l > 0 && i+k < 501 && j+l < 751
                        f(i+k,j+l) = f(i+k,j+l) + h1(k+2,2-l)*e;
%                     end
                end
            end
        end
    end
end

count = writeraw(b, 'error_diff_1.raw');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%errordiff_2
f = F;
for i = 3:498
    if mod(i,2) == 1
        for j = 3:748
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end
            e = f(i,j) - b(i,j);
            for k = 0:1:2
                for l = -2:1:2
                    if i-k > 0 && j-l > 0 && i-k < 501 && j-l < 751
                        f(i+k,j+l) = f(i+k,j+l) + h2(k+3,l+3)*e;
                    end
                end
            end
        end
    else
        for j = 748:-1:3
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end
            e = f(i,j) - b(i,j);
            for k = 2:-1:0
                for l = 2:-1:-2
                    if i-k > 0 && j-l > 0 && i-k < 501 && j-l < 751
                        f(i+k,j+l) = f(i+k,j+l) + h2(k+3,3-l)*e;
                    end
                end
            end
        end
    end
end

count = writeraw(b, 'error_diff_2.raw');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % errordiff_3
f = F;
for i = 3:498
    if mod(i,2) == 1
        for j = 3:748
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end
            e = f(i,j) - b(i,j);
            for k = 0:1:2
                for l = -2:1:2
                    if i-k > 0 && j-l > 0 && i-k < 501 && j-l < 751
                        f(i+k,j+l) = f(i+k,j+l) + h3(k+3,l+3)*e;
                    end
                end
            end
        end
    else
        for j = 748:-1:3
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end
            e = f(i,j) - b(i,j);
            for k = 2:-1:-2
                for l = 2:-1:-2
                    if i-k > 0 && j-l > 0 && i-k < 501 && j-l < 751
                        f(i+k,j+l) = f(i+k,j+l) + h3(k+3,3-l)*e;
                    end
                end
            end
        end
    end
end

count = writeraw(b, 'error_diff_3.raw');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% my method
f = F;
for i = 4:497
    if mod(i,2) == 1
        for j = 4:747
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end
            e = f(i,j) - b(i,j);
            for k = -3:1:3
                for l = -3:1:3
                    if i-k > 0 && j-l > 0 && i-k < 501 && j-l < 751
                        f(i+k,j+l) = f(i+k,j+l) + h4(k+4,l+4)*e;
                    end
                end
            end
        end
    else
        for j = 747:-1:4
            if f(i,j) < T
                b(i,j) = 0;
            else
                b(i,j) = 255;
            end
            e = f(i,j) - b(i,j);
            for k = 3:-1:-3
                for l = 3:-1:-3
                    if i-k > 0 && j-l > 0 && i-k < 501 && j-l < 751
                        f(i+k,j+l) = f(i+k,j+l) + h4(k+4,4-l)*e;
                    end
                end
            end
        end
    end
end

count = writeraw(b, 'error_diff_4.raw');