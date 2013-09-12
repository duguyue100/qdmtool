function [noDecisionA, noDecisionB]=calculateDecisionSpace(playerAPayoff, playerBPayoff)

% This function calculates the dimension of payoff matrix for both players.
% The function can check whether the input dataset is vaild.

if (size(playerAPayoff)==size(playerBPayoff))
    if (nDecisionA==2^(floor(log2(nDecisionA))) && nDecisionB==2^(floor(log2(nDecisionB))))
    [noDecisionA, noDecisionB]=size(playerAPayoff);
    else
        error('input dimension has to be 2^n');
    end
else
    error('dimension of two payoff matrices are not consistent');
end

end