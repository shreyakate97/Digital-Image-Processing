function label = kmeans_1(input_feature_vector)
s = size(input_feature_vector);
%choose 4 random centroids
number = randperm(s(1),4);
for i = 1:4
    centroid(i,:) = input_feature_vector(number(i),:);
end

flag = true;
iteration = 0;
while(flag == true)
    temp = centroid;
% calculate euclidean distance
for i = 1:s(1)
    for k = 1:4
        d(k) = sqrt(sum((input_feature_vector(i,:) - centroid(k,:)).^2));
    end
    minimum = min(d);
    for k = 1:4
        if minimum == d(k)
            label(i,:) = [i k];
        end
    end     
end

summ = zeros(1,s(2)); count = 0;
for k =1:4
    for i = 1:s(1)
        if label(i,2) == k
            summ = summ + input_feature_vector(i,:);
            count = count +1;
        end
        centroid(k,:) = summ/count; % new centroid
    end
    count = 0; summ = zeros(1,s(2));
end
check = abs(temp - centroid);
iteration = iteration +1;
if ( sum(sum(check)) == 0 || iteration == 100)
    flag = false;
end
end
disp(label);
end

