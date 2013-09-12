function [noDecisionA, noDecisionB]=calculateDecisionSpace(playerAPayoff, playerBPayoff)

% This function calculates the dimension of payoff matrix for both players.
% The function can check whether the input dataset is vaild.

[noDecisionA, noDecisionB]=size(playerAPayoff);

if (size(playerAPayoff)==size(playerBPayoff))
    if ~(noDecisionA==2^(floor(log2(noDecisionA))) && noDecisionB==2^(floor(log2(noDecisionB))))
        error('input dimension has to be 2^n');
    end
else
    error('dimension of two payoff matrices are not consistent');
end

end