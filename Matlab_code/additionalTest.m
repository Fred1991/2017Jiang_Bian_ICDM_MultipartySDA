function [Dg,Dl,D,AccMax3,AccMax2,AccMax1,AccMax4] = additionalTest(lambdaGlasso,numTrainDat)
% dataset load
%clear;
clc;

p = 200;
%numTrainDat = 50;
numTestDat = 200;
%machNum = 1;
%lambda = 10;
%lambdaGlasso = 10;

mftrain = zeros(p,1);
mttrain = vertcat(ones(10,1),zeros(p-10,1));
cov=zeros(p,p);
for i=1:p
    for j=1:p
        cov(i,j)=0.8^abs(i-j);        
    end
end

ttrain=mvnrnd(mttrain,cov,numTrainDat);
ftrain=mvnrnd(mftrain,cov,numTrainDat);
ttest=mvnrnd(mttrain,cov,numTestDat);
ftest=mvnrnd(mftrain,cov,numTestDat);

%[mut,muf,niterr,dxx] = SGD_mu(mt,mf,machNum,p);

tCov = 1/numTrainDat*(ttrain-repmat(mean(ttrain),numTrainDat,1))'*(ttrain-repmat(mean(ttrain),numTrainDat,1));
fCov = 1/numTrainDat*(ftrain-repmat(mean(ftrain),numTrainDat,1))'*(ftrain-repmat(mean(ftrain),numTrainDat,1));

mt=mean(ttrain);
mf=mean(ftrain);
scov = 0.5*tCov +  0.5*fCov;
 
%[b] = covEstwithGlobalMean(tt,ft,tt,ft,numTrainDat,machNum);

theta_star = 1\cov; 

% De-sparsify glasso

[gtheta,~] = graphicalLasso(scov, lambdaGlasso, 100, 1e-4);
ltheta = pinv(scov);
detheta = 2 * gtheta - gtheta * scov * gtheta;


xopt = detheta * (mt-mf)';
gxopt = gtheta * (mt-mf)';
lxopt = ltheta * (mt-mf)';
xopt_star = theta_star * (mttrain-mftrain);


D = norm(xopt-xopt_star,inf);
Dg = norm(gxopt-xopt_star,inf);
Dl = norm(lxopt-xopt_star,inf);
%[xopt,niter,dx] = SGD2(detheta,(mut-muf)',machNum,lambda);


[AccMax3, ~, ~, ~] = linearTestWithE0(xopt,ttest-repmat((mt+mf)/2,numTestDat,1),ftest-repmat((mt+mf)/2,numTestDat,1),numTestDat);
[AccMax1, ~, ~, ~] = linearTestWithE0(gxopt,ttest-repmat((mt+mf)/2,numTestDat,1),ftest-repmat((mt+mf)/2,numTestDat,1),numTestDat);
[AccMax2, ~, ~, ~] = linearTestWithE0(lxopt,ttest-repmat((mt+mf)/2,numTestDat,1),ftest-repmat((mt+mf)/2,numTestDat,1),numTestDat);
[AccMax4, ~, ~, ~] = linearTestWithE0(xopt_star,ttest-repmat((mttrain+mftrain)'/2,numTestDat,1),ftest-repmat((mttrain+mftrain)'/2,numTestDat,1),numTestDat);
%tp_count = 0;
%fp_count = 0;
%tn_count = 0;
%fn_count = 0;
%scatter(fp/numTestDat,tp/numTestDat);
