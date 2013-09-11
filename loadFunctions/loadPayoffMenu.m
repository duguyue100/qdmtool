function [playerAPayoff, playerBPayoff]=loadPayoffMenu(datasetList)

% This file provides a menu for loading existed dataset
% The dataset can be extended, see function savePayoffMenu.

datasetList=strcat('data/',datasetList);

load(datasetList,'DataList');


noDataList=size(DataList,1);
DataMenu=strcat(int2str((1:noDataList).'),{'. '},DataList);
disp('Choose a dataset from the list below:');
disp(DataMenu);

choice=input('Enter: ');

[playerAPayoff, playerBPayoff]=loadPayoffData(DataList{choice});

end