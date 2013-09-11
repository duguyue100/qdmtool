function V=utility(C, col)
%% this function is used to calculate utility

%% utility function
L=size(C,1);
V=0;
for i=1:L
    V=V+C(i,col);
end

V=V/L;

end
