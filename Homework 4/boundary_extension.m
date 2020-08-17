function ext_im = boundary_extension(G)
%convert to square matrix
row=128; col=128;
F = [];
for i = 0:(row-1)
    out = G(1+(i*col):col+(i*col));
    F = [ F; out];
end
%boundary extension
a = zeros(132,132);
a(3:130,3:130) = F;
%add rows
a(1,3:130) = F(2,:);
a(2,3:130) = F(1,:);
a(131,3:130) = F(128,:);
a(132,3:130) = F(127,:);
%add columns
a(3:130,1) = F(:,2);
a(3:130,2) = F(:,1);
a(3:130,131) = F(:,128);
a(3:130,132) = F(:,127);

ext_im = a;
end

