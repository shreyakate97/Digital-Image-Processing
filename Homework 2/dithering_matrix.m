%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: February 16, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
F = readraw('LightHouse.raw');
%dithering matrix
I2 = [ 1 2; 3 0];
I4 = [ (4*I2 + 1) (4*I2 + 2); (4*I2 + 3) (4*I2)];
I8 = [ (4*I4 + 1) (4*I4 + 2); (4*I4 + 3) (4*I4)];
I16 = [ (4*I8 + 1) (4*I8 + 2); (4*I8 + 3) (4*I8)];
I32 = [ (4*I16 + 1) (4*I16 + 2); (4*I16 + 3) (4*I16)];

% t = @(i,N) ((i + 0.5)*255)/N^2;
G = [];
for i = 0:499
    out = F(1+(i*750):750+(i*750));
    G = [ G; out];
end
Q = G;
%threshold matrix
N = 2;
for i = 1:N
    for j = 1:N
        T(i,j) = ((I2(i,j) + 0.5)*255)/N^2;
    end
end

for i = 1:500
    for j = 1:750
        if Q(i,j) < T(mod(i,N)+1,mod(j,N)+1)
            Q(i,j) = 0;
        else
            Q(i,j) = 255;
        end
    end
end
count = writeraw(Q, 'dithering_matrix_output_I2.raw');

Q = G;
N = 8;
for i = 1:N
    for j = 1:N
        T(i,j) = ((I8(i,j) + 0.5)*255)/N^2;
    end
end

for i = 1:500
    for j = 1:750
        if Q(i,j) < T(mod(i,N)+1,mod(j,N)+1)
            Q(i,j) = 0;
        else
            Q(i,j) = 255;
        end
    end
end
count = writeraw(Q, 'dithering_matrix_output_I8.raw');

Q = G;
N = 32;
for i = 1:N
    for j = 1:N
        T(i,j) = ((I32(i,j) + 0.5)*255)/N^2;
    end
end

for i = 1:500
    for j = 1:750
        if Q(i,j) < T(mod(i,N)+1,mod(j,N)+1)
            Q(i,j) = 0;
        else
            Q(i,j) = 255;
        end
    end
end
count = writeraw(Q, 'dithering_matrix_output_I32.raw');