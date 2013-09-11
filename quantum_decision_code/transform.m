function E=transform(H, t, Psi)
    E=[];
    i=sqrt(-1);
    %Psi
    %L=expm(-1*i*t*H)
    E=expm(-1*i*t*H)*Psi;
    %E=L*Psi
end