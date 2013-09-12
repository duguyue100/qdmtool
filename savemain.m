%% Clear running history

clc
%clear
close all

%% Description

% This file contains some useful functions to create, modify and maintain
% your dataset and relevent files.

%% Menu

welcome=sprintf('Management Tools for Quantum-Inspired Decision Making Model\n\n');
disp(welcome);
disp('The following are options:')
disp('1. Save Payoff Matrix');
disp('2. Save Dataset to Data List');
choice=input('Enter (e.g. 1,2,...): ');

switch (choice)
    case 1
        disp('-----Save Payoff Matrix-----');
        datasetName=input('Enter dataset name: ','s');
        playerAPayoffName=input('Enter Player A''s Payoff Matrix name: ','s');
        playerBPayoffName=input('Enter Player B''s Payoff Matrix name: ', 's');
        savePayoffMatrix(datasetName, playerAPayoffName, playerBPayoffName);
    case 2
        disp('-----Save Dataset to Data List-----');
        datasetListName=input('Enter dataset list name: ','s');
        datasetName=input('Enter dataset name: ','s');
        savePayoffMenu(datasetListName, dataset);
end