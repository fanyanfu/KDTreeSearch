function [] = bucketDistance(bucket_node, bucket_id, pos, k, includeTies, neighbor)
% compute distance between a bucket and test data
% bucket_node  -- data in bucket
% bucket_id    -- id 
%
    all_dist = dist(pos', bucket_node);
    dist_idx =[all_dist', bucket_id'];
    temp = get(neighbor, 'value');
    tempdist = sortrows([dist_idx ; temp],1);
    if(~includeTies)
        set(neighbor, 'value', tempdist(1:k,:));
    else
        temp1(1:k-1,:) = [tempdist(1:k-1), tempid(1:k-1)];
        num = numel(find(tempdist(k:end)==tempdist(k))) + k -1;
        temp1(k:num,:) = [tempdist(k:num), tempid(k:num)];
        set(neighbor, 'value', temp1);
    end
end

