function [accuracy, F1, F1Max, AccMax, AUC, tp, fp] = testpesudoS(lambda,lambdaGlasso,machNum,S)
% dataset load
% clear;
% clc;

p = 200;
numTrainDat = 10000;
numTestDat = 200;
%machNum = 4;
% lambda = 13;
% lambdaGlasso = 3;

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
%optimal beta
%betaopt = 1\cov * (mttrain-mftrain);
%
[tt,ft,mt,mf]=dataSplit(ttrain,ftrain,numTrainDat,machNum);

muts = zeros(p,1);
mufs = zeros(p,1);
for i=1:S
    [mut,muf,niterr,dxx] = SGD_mu(mt,mf,machNum,p);
    muts = muts + mut;
    mufs = mufs + muf;
    disp(['SGD_mu ',num2str(i),' run finished.']);
end
muts = muts/S;
mufs = mufs/S;

[b] = covEstwithGlobalMean(tt,ft,muts,mufs,numTrainDat,machNum);

% De-sparsify glasso
for i=1:machNum
    [theta,~] = graphicalLasso(b(:,:,i), lambdaGlasso, 100, 1e-4);
    detheta(:,:,i) = 2 * theta - theta * b(:,:,i) * theta;
end

xopts = zeros(p,1);
for i=1:S
    [xopt,niter,dx] = SGD2(detheta,(muts-mufs)',machNum,lambda);
    xopts = xopts + xopt;
    disp(['SGD2 ',num2str(i),' run finished.']);
end
xopts = xopts/S;

%truncate
for i=1:size(xopts,1)
   if abs(xopts(i)) <= 10^(-4)  
       xopts(i) = 0;
   end
end

[accuracy, F1, precision, recall, F1Max, AccMax, tp, fp, prediction] = linearTest(xopts,ttest,ftest,numTestDat);
%[accuracy, F1, precision, recall, F1Max, AccMax, tp, fp, prediction] = linearTest(betaopt,ttest,ftest,numTestDat);
%tp_count = 0;
%fp_count = 0;
%tn_count = 0;
%fn_count = 0;

[xsorted, I] = sort(fp/numTestDat);
y = tp/numTestDat;
ysorted = y(I);
%plot(xsorted,ysorted);
AUC = trapz(xsorted,ysorted);
%scatter(fp/numTestDat,tp/numTestDat);

