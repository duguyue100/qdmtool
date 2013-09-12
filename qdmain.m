%% Clear running history and set working parameters

clc
clear
close all

% specify dataList's name
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

% noDecisionA=number of A's Decisions, noDecisionB=number of B's Decisions;
[noDecisionA, noDecisionB]=calculateDecisionSpace(playerAPayoff, playerBPayoff);

% Initial Quantum State

PSI0=ones(noDecisionB, noDecisionA)*(1/sqrt(noDecisionA*noDecisionB));

% Time factor

time=pi/2;

% Result Storage;

Result=[];

% Calculate Hamiltonian

disp('Please choose simulation mode:');
disp('1. Two-Stage QDM');
disp('2. One-Stage QDM');
simulationMode=input('Enter (1 or 2):');

Hamiltonian=calculateHamiltonian(playerAPayoff, noDecisionA, playerBPayoff, noDecisionB);


%% Decision Making process: design for both two-stage QDM and one-stage QDM

if (simulationMode==1)
    % First Transformation
    
    PSI1=[];
    for i=1:noDecisionB
        temp=zeros(noDecisionB,noDecisionA);
        temp(i,:)=PSI0(i,:)*sqrt(noDecisionB);
        PSI1=[PSI1;temp];
    end

    % Second Transformation
    
    for i=1:noDecisionB
        temp=PSI1';
        decision=temp(:);
        PSI2=transform(Hamiltonian, time, decision(noDecisionA*noDecisionB*(i-1)+1:noDecisionA*noDecisionB*i));
        CurrentResult=abs(PSI2.^2);
        %Result=[Result; CurrentResult((i-1)*noDecisionA+1:i*noDecisionA)'];
        Result=[Result; CurrentResult'];
    end

elseif (simulationMode==2)
    % One stage transformation
    PSIONE=PSI0(:);
    PSITWO=transform(Hamiltonian, time, PSIONE);
    PSITWO=abs(PSITWO.^2);
    
    Result=zeros(1,noDecisionA);
    for i=1:noDecisionB
        Result=Result+PSITWO((i-1)*noDecisionA+1:i*noDecisionA)';
    end
end


%% Results

if (simulationMode==1)
    disp('Result of Two-Stage QDM:');
    for i=1:noDecisionB
        result=sprintf('Result of Decision %d: \n', i);
        disp(result);
        disp(Result(i,:));
    end
elseif (simulationMode==2)
    disp('Result of One-Stage QDM: ');
    disp(Result);
end
