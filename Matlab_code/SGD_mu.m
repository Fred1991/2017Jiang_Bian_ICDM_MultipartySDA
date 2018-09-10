function [omut,omuf,niterr,dxx] = SGD_mu(S,Q,number,p)
% initialize
%p = 4;
% maximum number of allowed iterations
%maxiter = 100000;
maxiter = 1000;

% minimum allowed perturbation
dxmin = 1e-8;

% step size ( 0.33 causes instability, 0.2 quite accurate)
%alpha = 1e-2;
alpha = 1e-3;
% initialize gradient norm, optimization vector, iteration counter, perturbation
%gnorm = inf; meand0; 
t_mean =  zeros(p,1);
f_mean =  zeros(p,1);
niterr = 0; 
dxx = inf;



while and(niterr < maxiter, dxx >= dxmin)
    pause(0.01);
    % random shaffle data
    %S = S(:,:,randperm(size(S,3)));
    j = randi([1,number]); 
        % take step:
        mut = S(:,:,j);
        muf = Q(:,:,j);
        %mud = meand(:,:,j + 1);
        dxx=max(abs(t_mean - mut'));
    
        t_mean = t_mean - alpha * 2 * (t_mean - mut') ;
 
     %   dxx = norm(meandnewt,1);
        
        dxx = dxx + max(abs(f_mean - muf'));
        f_mean = f_mean - alpha * 2 * (f_mean - muf');
 
        %dxxf = norm(meandnewf,1);
        display(dxx);
        
    disp(['SGD_mu ',num2str(niterr),' iteration finished.']);   
    niterr = niterr + 1;
    
end

 omut = t_mean;    
 omuf = f_mean;
 
    
