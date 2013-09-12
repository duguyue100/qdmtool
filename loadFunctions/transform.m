function PSI2=transform(Hamiltonian, time, Psi)

% this function performs time dependent Schordinger Equation

    PSI2=[];
    i=sqrt(-1);
    PSI2=expm(-1*i*time*Hamiltonian)*Psi;
end