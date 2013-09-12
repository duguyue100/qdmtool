function Hamiltonian=calculateHamiltonian(playerAPayoff, noDecisionA, playerBPayoff, noDecisionB)

% This function explains the ways to calculate Hamiltonian matrix for
% the decision space.

% calculate HA

Hadamard=hadmard(noDecisionA);

HA=zeros(noDecisionA*noDecisionB);
for i=1:noDecisionB
    U=zeros(noDecisionA, noDecisionA);
    utility=calcauleUtility(playerAPayoff, playerBPayoff, i);
    U=U.*(utility*eye(nDecisionA));
    HATemp=(1/sqrt(utility^2+noDecisionA-1))*(Hadamard.*U);
    start=(i-1)*nDecisionA+1;
    endd=i*nDecisionA;
    HA(start:endd,start:endd)=HATemp;
end

if (noDecisionA==noDecisionB) % means has HB
    
    % A default HB for 2 by 2 decision space
    gamma=2.09;
    HB=[1,0,1,0;
        0,-1,0,1;
        1,0,-1,0;
        0,1,0,1];
    HB=HB*((-1*gamma)/sqrt(2));
    
    % workout the program can generate valid HB
    
    Hamiltonian=HA+HB;
else
    Hamiltonian=HA;
end

end