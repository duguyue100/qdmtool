function [playerAPayoff, playerBPayoff]=loadPayoff()

disp(' ');
dataName=input('Please input the name of dataset (.mat): ','s');

[playerAPayoff, playerBPayoff]=loadPayoffData(dataName);

end