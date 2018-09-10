function [xopt,niter,dx] = SGD2(S,meand,number,lambda)

p = size(S,1);

%beta0 = zeros(p,1);

% termination tolerance
%tol = 1e-6;

% maximum number of allowed iterations
%maxiter = 10000;
maxiter = 1000;
% minimum allowed perturbation
dxmin = 1e-4;

% step size 
alpha = 1e-6;

% regularization parameter
%lambda = 0.01;

% initialize gradient norm, optimization vector, iteration counter, perturbation
%gnorm = inf; 
beta = zeros(p,1); 
niter = 1; 
dx = inf;

for i=1:number
    %beta = beta + ((S(:,:,i)+20*eye(p,p))\meand');
    beta = beta + S(:,:,i) * meand' ;
end
beta = beta/number;


% gradient descent algorithm:
while and(niter <= maxiter, dx>=dxmin)
    pause(0.01);
    betadx = zeros(p,1);
    % random shaffle data
    %S = S(:,:,randperm(size(S,3)));
     j = randi([1,number]); 
        % take step:
        sigma = 1\S(:,:,j);
        %mud = meand(:,:,j + 1);
        [~,K]=max(abs(sigma*beta-meand'));
        for i = 1:size(beta,1)
            if beta(i) >= 0 && (sigma(K,:)*beta-meand(K)) >= 0
                
                betadx(i) = - 1*(lambda + sigma(K,i));
                
            elseif beta(i) < 0 && (sigma(K,:)*beta-meand(K)) >= 0
                
                betadx(i) =  - 1*(-lambda + sigma(K,i));
                
            elseif beta(i) >= 0 && (sigma(K,:)*beta-meand(K)) < 0  
                
                betadx(i) = - 1*(lambda - sigma(K,i));
                
            elseif beta(i) < 0 && (sigma(K,:)*beta-meand(K)) < 0
                
                betadx(i) = - 1*(-lambda - sigma(K,i));
                
            end
            %display(betanew);
            %display(beta);
        end  
        % check step
        if ~isfinite(betadx)
            display(['Number of iterations: ' num2str(niter)])
            error('x is inf or NaN')
        end
        dx = norm(betadx,1);
        %display(norm(sigma*beta-meand',1));
        beta = beta + alpha * betadx;    
 
    %disp(['SGD2 ',num2str(niter),' iteration finished.']);
    niter = niter + 1;
end
xopt = beta;
