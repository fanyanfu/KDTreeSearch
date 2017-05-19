# KDTreeSearch
matlab code for searching k nearest neighbors.  
  
  
This project is designed for searching k nearest neighbors in matlab environment, because in matlab toolbox, only mex file is provided to 
search k nearest neighbors. Consequently, you can just combine code in this project with createn method supported by matlab toolbox.
  
## How to use this code?
1.  modify your kdtreesearcher.m file.  
Type this command to open kdtreesearcher.m file in toolbox
```
open kdtreesearcher
```
Then you should modify GetAccess from 'private' into 'public'
```
    properties (GetAccess='public', SetAccess='private')
        
        nx_nonan = 0; %the number of points with no-NaN values
        wasnanIdx = []; %the index that has NaN values
        
        % The dimension along which each node is split, or 0 for a leaf
        % node.
        cutDim = zeros(0,1);
```
(Reason: we need these information in searching process)

2.  create kdtree through createn method in matlab
Example:
```
KDT_sdss= createns(train_data,'NsMethod','kdtree', 'Distance','euclidean');
```

3.  Download our code and use them to search nearest neighbor
Example:
```
[idx, dist] = knnsearch1(KDT_sdss, test_data, 'k', k)
```
## My problem
1.  I quote a lot of code in knnsearch1.m from knnsearch.m in matlab toolbox.(Actually, most of code in that file come from knnsearch.m). 
I don't know whether I infringe the copyright of matlab toolbox since I reserve the copyright illustration from original file in 
knnsearch1.m.
2.  It's a small project, and I haven't completed the code through other type of distance. Maybe this part can be completed in some time.
3.  Sorry for my poor English :)


