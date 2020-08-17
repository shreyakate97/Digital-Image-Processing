function out2 = f_extraction_1c(filter,out,row,col)
%average energy
energy = 0;
out2 = [];
for k = 3:row+2
    for l = 3:col+2
        t = 0;
        for i= -2:2
            for j = -2:2
               t  = t + (out(k+i,l+j)*filter(i+3,j+3));
            end
        end 
        out2(k-2,l-2) = t;
    end
end
end
