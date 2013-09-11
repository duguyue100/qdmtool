%% Clear running history and set working parameters

clc;
clear;
close all;

datasetList='dataList.mat';

%% Initialization

welcome=sprintf('This is the simulation of Quantum-Inpired Decision Making Model\n\n');
disp(welcome);

disp('Choose data loading mode:');
disp('1. Manually load.');
disp('2. Select existed data set.');
Choice=input('Enter: ');

% Load payoff matrix: The simulation is two agents based.

if (Choice==1)
    % Mode 1:
    [playerAPayoff, playerBPayoff]=loadPayoff();
else
    % Mode 2:
    [playerAPayoff, palyerBPayoff]=loadPayoffMenu(datasetList);
end

% Setting Parameters

%% Decision Making process: design for both two-stage QDM and one-stage QDM

% First Transformation


% Second Transformation


%% Results

