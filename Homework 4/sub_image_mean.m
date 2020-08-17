function out = sub_image_mean(ext_im,row,col)
%subtract image mean
mean = sum(ext_im(:))/(row+4)*(col+4);
mean = mean*ones((row+4),col+4);
out = ext_im - mean;
end

