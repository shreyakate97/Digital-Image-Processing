function energy = window_energy(out,row,col,n)
%average energy
out1=zeros(row+(n-1),col+(n-1));
out1(1+0.5*(n-1):row+0.5*(n-1),1+0.5*(n-1):col+0.5*(n-1))=out;
for i=1:0.5*(n-1)
   out1(i,0.5*(n-1)+1:col+0.5*(n-1))=out(0.5*(n-1)-i+2,1:col);
   out1(0.5*(n-1)+row+i,0.5*(n-1)+1:col+0.5*(n-1))=out(row-i,1:col);
end
for j=1:0.5*(n-1)
   out1(:,j)=out1(:,2*0.5*(n-1)-j+2);
   out1(:,col+0.5*(n-1)+j)=out1(:,(0.5*(n-1)+col)-j);
end


energy = 0;
out2 = []; temp =0;
for k=1+0.5*(n-1):row+0.5*(n-1)
    for l=1+0.5*(n-1):col+0.5*(n-1)   
        temp = 0;
        for i= -(n-1)/2:(n-1)/2
            for j = -(n-1)/2:(n-1)/2
               temp=temp+(1/(n))*((abs(out1(i+k,j+l))));
            end
        end
        energy(k-0.5*(n-1),l-0.5*(n-1))=temp;
    end
end
end


