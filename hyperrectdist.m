function dist = hyperrectdist(rect, pos)
% compute the distance between rect and pos 
% rect  -- upper and lower of rectangle, 1 column is min-value, 2 column is
%          max-value
% pos   -- position of that node
%
dist = 0;
num_f = length(pos);
for i = 1:num_f
    if(pos(i)<rect(i,1))
        dist = dist + (rect(i,2)-pos(i))^2;
    elseif(pos(i)>rect(i,2))
        dist = dist + (pos(i)-rect(i,1))^2;
    end
end
dist = sqrt(dist);
end

