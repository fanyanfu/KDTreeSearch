function dist = hyperrectdist(rect, pos)
% compute the distance between rect and pos 
% rect  -- upper and lower of rectangle, 1 column is min-value, 2 column is
%          max-value
% pos   -- position of that node
%
lowerbound = rect(:,1);
upperbound = rect(:,2);
a = pos > lowerbound & pos < upperbound;
bound_pos = zeros(length(pos),1);
bound_pos(a) = 0;
bound_pos(~a) = max([lowerbound(~a)-pos(~a),pos(~a)-upperbound(~a)],[],2);
bound_pos(bound_pos == -Inf) = 0;
dist = sqrt(sum(bound_pos.^2));
end

