function [Dg,Dl,D,AccMax3,AccMax2,AccMax1,AccMax4]=Results(ttrain,ftrain,ttest,ftest,numTrainDat,numTestDat,mftrain,mttrain,lambdaGlasso,cov)

%[mut,muf,niterr,dxx] = SGD_mu(mt,mf,machNum,p);

tCov = 1/numTrainDat*(ttrain-repmat(mean(ttrain),numTrainDat,1))'*(ttrain-repmat(mean(ttrain),numTrainDat,1));
fCov = 1/numTrainDat*(ftrain-repmat(mean(ftrain),numTrainDat,1))'*(ftrain-repmat(mean(ftrain),numTrainDat,1));

mt=mean(ttrain);
mf=mean(ftrain);
scov = 0.5*tCov +  0.5*fCov;

%[b] = covEstwithGlobalMean(tt,ft,tt,ft,numTrainDat,machNum);

% De-sparsify glasso
[gtheta,~] = graphicalLasso(scov, lambdaGlasso, 100, 1e-4);
theta_star = 1\cov; 
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


[~, ~, ~, ~, ~, AccMax3, ~, ~, ~] = linearTest(xopt,ttest-repmat((mt+mf)/2,numTestDat,1),ftest-repmat((mt+mf)/2,numTestDat,1),numTestDat);
[~, ~, ~, ~, ~, AccMax1, ~, ~, ~] = linearTest(gxopt,ttest-repmat((mt+mf)/2,numTestDat,1),ftest-repmat((mt+mf)/2,numTestDat,1),numTestDat);
[~, ~, ~, ~, ~, AccMax2, ~, ~, ~] = linearTest(lxopt,ttest-repmat((mt+mf)/2,numTestDat,1),ftest-repmat((mt+mf)/2,numTestDat,1),numTestDat);
[~, ~, ~, ~, ~, AccMax4, ~, ~, ~] = linearTest(xopt_star,ttest-repmat((mttrain+mftrain)'/2,numTestDat,1),ftest-repmat((mttrain+mftrain)'/2,numTestDat,1),numTestDat);