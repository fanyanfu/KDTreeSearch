function [idx, dist] = knnsearchx(X2, Y, numNN2, ~, obj, wasNaNY, includeTies)
%This function is used to find k nearest neighbor
% X2          -- the converted train dataset
% Y           -- all test dataset
% numNN2      -- k 
% obj         -- class object of kdtree
% wasNaNY     -- for every test data, if it has nan value
% includeTies -- whether we should conclude those equal dist.
len_Y = size(Y,2);
idx = zeros(len_Y,numNN2);
dist = zeros(len_Y,numNN2);
for i = 1:len_Y
    %find the leaf node which our test data Y[:,i] belongs
    if(wasNaNY(i)==0)
        x = Inf(numNN2,2);
        %declare
        neighbor = libpointer('doublePtr', x);
        pos = Y(:,i);
        findnearest(X2, 1, pos, obj, numNN2, neighbor , includeTies)
        temp = get(neighbor,'value');
        idx(i,:) = temp(:,1)';
        dist(i,:) = temp(:,2)';
    else
        idx(i,:) = 1:numNN2;
        dist(i,:) = nan(1,numNN2);
    end
end
end