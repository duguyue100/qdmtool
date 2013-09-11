%% This main file is used to simulate quantum decision making model

% The payoff matrix looks like 
%                            Cough(A) Cold(B) Heart_Attack(C)
% Gentle Reminder        (1)  10,7     4,7     1,1
% Bring Medicine         (2)  7,10     10,10   4,4
% Remind Doctor          (3)  4,4      7,4     7,7
% Call Doc+Bring Medicine(4)  1,1      2,1     10,10
%
% Utility function:
%  u(Table, Column)=sum of the column/no. of row
%
% The output contains two matrix, the first matrix can be divided in three
% part, each of them contain 4 rows. 
%
% The first 4 row represents the decision making when recognized Cough, 
% The second 4 row represents the decision making when recognized Cold,
% The third 4 row represents the decision making when recognized Heart_Attack, 
%
% The second matrix presents one-stage quantum decsion making
% represents the probability when there is no symptom recognized.
%


%% load inital setting

clear; % clear varibles
clc; % clear window

% initial payoff matrix
%tableC=[10,4,1;7,10,4;4,7,7;1,2,10];
%tableP=[7,7,1;10,10,4;4,4,7;1,1,10];

%tableC=[1,2,5;4,3,3;5,4,7;2,0,3];
%tableP=[2,2,1;1,5,3;2,4,0;3,4,0];

%tableC=[10,25;5,20];
%tableP=[10,5;25,20];

tableC=[7,6,5,4,3,2,1,0;0,0,0,0,0,0,0,0];
tableP=[0,1,2,3,4,5,6,7;0,0,0,0,0,0,0,0];

% M=no. of actions, N= no. of symptom.
[M, N]=size(tableC);

% initial quantum state
psi0=ones(N, M)*(1/sqrt(N*M));

%% two-stage quantum decision

% 1st transformation
psi1=[];
for i=1:N
    temp=zeros(N,M);
    temp(i,:)=psi0(i,:)*sqrt(N);
    psi1=[psi1;temp];
end

% Hamiltonian
Hh=hadamard(M); % Hadmamard;
Ht=[];
Z=zeros(M,M);
for i=1:N
    t=Hh;
    u=utility(tableP,i);
    T=ones(M,M);
    for j=1:M
        %T(j,j)=u;
        % for prisoner deliema;
        if (i==1)
            mu=-0.41;
            T(j,j)=mu;
        end
        if (i==2)
            mu=-0.39;
            T(j,j)=mu;
        end
        if (i==3)
            mu=-0.32;
            T(j,j)=mu;
        end
        if (i==4)
            mu=0.19;
            T(j,j)=mu;
        end
        if (i==5)
            mu=0.38;
            T(j,j)=mu;
        end
        if (i==6)
            mu=0.11;
            T(j,j)=mu;
        end
        if (i==7)
            mu=0.05;
            T(j,j)=mu;
        end
        if (i==8)
            mu=0.04;
            T(j,j)=mu;
        end
    end
    %t=t.*T*(1/sqrt(u^2+M-1));
    t=t.*T*(1/sqrt(mu^2+M-1));
    for j=1:N
        if (j==i)
            Ht=[Ht,t];
        else
            Ht=[Ht,Z];
        end
    end
end
H=[];
for i=1:N
    H=[H;Ht(1:M,(M*N*(i-1)+1):(M*N*i))];
end
% for two action space only.
%gamma=2.09;
%H2=[1,0,1,0;0,-1,0,1;1,0,-1,0;0,1,0,1];
%H2=H2*((-1*gamma)/sqrt(2));

%H=H+H2;

%time=1*pi/2;
time=pi/2*1;
d=zeros(M*N,1);
for i=1:N
    A=psi1';
    t=A(:);
    %d=d+transform(H,time,t(M*N*(i-1)+1:M*N*i));
    c=transform(H,time,t(M*N*(i-1)+1:M*N*i));
    abs(c.^2)
end

%time1=pi/2;
%d2=zeros(M*N,1);
%for i=1:1
%    A=psi1';
%    t=A(:);
%    %t=psi0(:);
%    d2=d2+transform(H2,time1,t(M*N*(i-1)+1:M*N*i));
%    %d2=d2+transform(H2,time1,t);
%end

%D=abs(d.^2);
%D=[];
%for i=1:M
%    t=0;
%    for j=1:N
%        t=t+d(M*(j-1)+i);
%    end
%    D=[D;t];
%end

%P=abs(D.^2);
%disp(D);

%% one-stage Quantum Decision Model

B=psi0(:);
d1=transform(H,time,B);

d1=abs(d1.^2);
D1=[];
for i=1:M
    t=0;
    for j=1:N
        t=t+d1(M*(j-1)+i);
   end
    D1=[D1;t];
end

disp(D1);
