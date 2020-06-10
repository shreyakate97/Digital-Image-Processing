%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name:  Shreya Kate 
% ID:  2334973997 
% email:  shreyak@usc.edu 
% Submission Date: January 28, 2020 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
G = readraw('Toy.raw');
rc = zeros(1,256); gc = zeros(1,256); bc = zeros(1,256);
for i = 0: 223999
    rc(G(3*i + 1)+1) = rc(G(3*i + 1)+1)+1;
    gc(G(3*i + 2)+1) = gc(G(3*i + 2)+1)+1;
    bc(G(3*i + 3)+1) = bc(G(3*i + 3)+1)+1;
end

figure(1)
subplot(3,1,1)
plot(1:256,rc,'.r')
xlabel('intensity')
ylabel('pixels')
title('red channel')

subplot(3,1,2)
plot(1:256,gc,'.g')
xlabel('intensity')
ylabel('pixels')
title('green channel')

subplot(3,1,3)
plot(1:256,bc,'.b')
xlabel('intensity')
ylabel('pixels')
title('blue channel')

%probabilities of each intensity
prob_rc = rc/224000;
prob_gc = gc/224000;
prob_bc = bc/224000;

%cumulative probabilities
cuml_rc = zeros(1,256); cuml_gc = zeros(1,256); cuml_bc = zeros(1,256);
cuml_rc(1) = prob_rc(1); cuml_gc(1) = prob_gc(1);cuml_bc(1) = prob_bc(1);
for i = 2:256
    cuml_rc(i) = cuml_rc(i-1) + prob_rc(i);
    cuml_gc(i) = cuml_gc(i-1) + prob_gc(i);
    cuml_bc(i) = cuml_bc(i-1) + prob_bc(i);
end
figure(2)
subplot(3,1,1)
plot(1:256,prob_rc,'.r')
xlabel('intensity')
ylabel('pixels')
title('red channel')

subplot(3,1,2)
plot(1:256,prob_gc,'.g')
xlabel('intensity')
ylabel('pixels')
title('green channel')

subplot(3,1,3)
plot(1:256,prob_bc,'.b')
xlabel('intensity')
ylabel('pixels')
title('blue channel')

figure(3)
subplot(3,1,1)
plot(1:256,cuml_rc,'.r')
xlabel('intensity')
ylabel('pixels')
title('red channel')

subplot(3,1,2)
plot(1:256,cuml_gc,'.g')
xlabel('intensity')
ylabel('pixels')
title('green channel')

subplot(3,1,3)
plot(1:256,cuml_bc,'.b')
xlabel('intensity')
ylabel('pixels')

L = 256;
map_r = zeros(1,256); map_g = zeros(1,256); map_b = zeros(1,256);

map_r = floor(255*cuml_rc);
map_g = floor(255*cuml_gc);
map_b = floor(255*cuml_bc);
G1 = zeros(1,672000);
for i = 0:223999
    G1(3*i + 1) = map_r(G(3*i + 1)+1);
    G1(3*i + 2) = map_g(G(3*i + 2)+1);
    G1(3*i + 3) = map_b(G(3*i + 3)+1);
end
count = writeraw(G1, 'Toy1.raw');

%Method_B
G = readraw('Toy.raw');

bucket_size = 224000/256;
old_rpos = [];  old_rint = [];
old_bpos = [];  old_bint = [];
old_gpos = [];  old_gint = [];
% for red
index = 1;
for j = 0: 255 %intensities
    for i = 0: 223999 
       if G(3*i + 1) == j
           old_rint(index) = G(3*i + 1);
           old_rpos(index) = 3*i + 1;
           index = index +1;
       end
    end
end

% for green
index = 1;
for j = 0: 255 %intensities
    for i = 0: 223999 
       if G(3*i + 2) == j
           old_gint(index) = G(3*i + 2);
           old_gpos(index) = 3*i + 2;
           index = index +1;
       end
    end
end
% for blue
index = 1;
for j = 0: 255 %intensities
    for i = 0: 223999 
       if G(3*i + 3) == j
           old_bint(index) = G(3*i + 3);
           old_bpos(index) = 3*i + 3;
           index = index +1;
       end
    end
end

new_rint = []; index = 1; currentsize = 0; bucketsfilled = 0;
for i = 1:224000
    if currentsize ~= bucket_size
        old_rint(index) = bucketsfilled;
        index = index + 1;
        currentsize = currentsize + 1;
    else
        bucketsfilled = bucketsfilled + 1;
        currentsize = 0;
    end
end

new_gint = []; index = 1; currentsize = 0; bucketsfilled = 0;
for i = 1:224000
    if currentsize ~= bucket_size
        old_gint(index) = bucketsfilled;
        index = index + 1;
        currentsize = currentsize + 1;
    else
        bucketsfilled = bucketsfilled + 1;
        currentsize = 0;
    end
end
new_bint = []; index = 1; currentsize = 0; bucketsfilled = 0;
for i = 1:224000
    if currentsize ~= bucket_size
        old_bint(index) = bucketsfilled;
        index = index + 1;
        currentsize = currentsize + 1;
    else
        bucketsfilled = bucketsfilled + 1;
        currentsize = 0;
    end
end
out1 = zeros(1,672000);
for i = 0:223999
    index = old_rpos(i+1);
    out1(index) = old_rint(i+1);
end
for i = 0:223999
    index = old_gpos(i+1);
    out1(index) = old_gint(i+1);
end
for i = 0:223999
    index = old_bpos(i+1);
    out1(index) = old_bint(i+1);
end

rc = zeros(1,256); gc = zeros(1,256); bc = zeros(1,256);
for i = 0: 223999
    rc(out1(3*i + 1)+1) = rc(out1(3*i + 1)+1)+1;
    gc(out1(3*i + 2)+1) = gc(out1(3*i + 2)+1)+1;
    bc(out1(3*i + 3)+1) = bc(out1(3*i + 3)+1)+1;
end

figure(4)
subplot(3,1,1)
plot(1:256,rc,'.r')
xlabel('intensity')
ylabel('pixels')
title('red channel')

subplot(3,1,2)
plot(1:256,gc,'.g')
xlabel('intensity')
ylabel('pixels')
title('green channel')

subplot(3,1,3)
plot(1:256,bc,'.b')
xlabel('intensity')
ylabel('pixels')
title('blue channel')

c = writeraw(out1 , 'Toy2.raw');