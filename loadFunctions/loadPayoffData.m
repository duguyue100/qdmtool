function [playerAPayoff, playerBPayoff]=loadPayoffData(dataName)

% This file is used to load data from a .mat file.
% data are supposed to stored in /data directory.

dataName=strcat('data/',dataName);

load(dataName,'playerAPayoff','playerBPayoff');

end