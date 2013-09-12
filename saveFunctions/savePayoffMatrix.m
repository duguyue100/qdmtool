function savePayoffMatrix(dataset, playerAPayoff, playerBPayoff)

% check and save payoff matrix to a particular problem's payoff matrices.

dataset=strcat('data/',dataset);
save(dataset, playerAPayoff, playerBPayoff);

end