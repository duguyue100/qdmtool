function savePayoffMenu(datasetList, dataset)

% This file is able to modify and maintain the list of dataset.
% Currently, the file is able to add dataset manually by providing
% the list name and dataset name.
% all the names should be in .mat format
% example: savePayoffMenu('datalist.mat', 'dataset.mat');

datasetList=strcat('data/',datasetList);

if  exist(datasetList)
    load(datasetList, 'DataList');
    DataList=[DataList;{dataset}];
    save(datasetList,'DataList');
else
    DataList=[{dataset}];
    save(datasetList,'DataList');
end

end