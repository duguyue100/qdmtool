function Hamiltonian=calculateHamiltonian(playerAPayoff, noDecisionA, playerBPayoff, noDecisionB)

% This function explains the ways to calculate Hamiltonian matrix for
% the decision space.

% calculate HA

Hadamard=hadamard(noDecisionA);

HA=zeros(noDecisionA*noDecisionB);
for i=1:noDecisionB
    % calculating utility.
    % utility=calcauleUtility(playerAPayoff, playerBPayoff, i);
    % for testing
    utility=0.51;
    
    % calculating HATemp
    U=ones(noDecisionA, noDecisionA);
    U=U+(utility*eye(noDecisionA))-eye(noDecisionA);
    HATemp=(1/sqrt(utility^2+noDecisionA-1))*(Hadamard.*U);
    
    % replacing HATemp in HA
    start=(i-1)*noDecisionA+1;
    endd=i*noDecisionA;
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