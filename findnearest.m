function [] = findnearest(X2, node, pos, obj, k, neighbor , includeTies)
% recursively find nearest neighbors
% neighbor   -- pointer type
%
    dim = obj.cutDim(node);
    if(pos(dim)<obj.cutVal(node))
        nearernode = obj.leftChild(node);
        farthernode = obj.rightChild(node);
    else
        nearernode = obj.rightChild(node);
        farthernode = obj.leftChild(node);
    end
    if(~obj.leafNode(nearernode))
        findnearest(X2, nearernode, pos, obj, k, neighbor, includeTies);
    else
        bucket_node = X2(:,obj.idx{nearernode});
        bucketDistance(bucket_node, obj.idx{nearernode}, pos, k, includeTies, neighbor);    
    end
    temp = get(neighbor, 'value');
    %compute the distance between all node in bucket and test
    %backtracking to search nearest neighbors
    if(farthernode)
        rect = [obj.lowerBounds(farthernode,:)', obj.upperBounds(farthernode,:)'];
        farther_dist = hyperrectdist(rect, pos);
        if(farther_dist < temp(end, 1))
            if(~obj.leafNode(farthernode))
                findnearest(X2, farthernode, pos, obj, k, neighbor , includeTies);
            else
                bucket_node = X2(:,obj.idx{farthernode});
                bucketDistance(bucket_node, obj.idx{farthernode}, pos, k, includeTies, neighbor);    
            end
        end
    end
end

