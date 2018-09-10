%%%% Generate data
clear;
p = 100; n =2*p;

%% Sparse Sigma
SigTrue = toeplitz([1,0.4,zeros(1,p-2)]);    
w = eig(SigTrue); delta = (p*min(w)-max(w))/(1-p); SigTrue = SigTrue + delta*eye(p);
 
%% Dense Sigma 
% SigTrue = ones(p)+eye(p); % Dense
 
 Y = mvnrnd(zeros(p,1),SigTrue,n)'; 



    
 S = Y*Y'/n; % sample covariance matrix;

 rho = 0.3; Rho = rho*ones(p)-rho*eye(p); % shrinkage parameters;
 
 SigInit = S; % Initial Value;
 
 
 
%%%%%%%%%%% ECM algorithm
   [Sig_ecm,C_ecm,loglik_ecm] = CglassoECM(S,Rho,SigInit,1e-3,1e4);

%%%%%%%%%%% Coordinate descent algorithm 
[Sig_cd,C_cd,loglik_cd] = CglassoCD(S,Rho,SigInit,1e-3,200,1e4);


