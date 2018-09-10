function [accuracy, F1, F1Max, AccMax, AUC, tp, fp] = DsparseLDA(lambdaGlasso)
% dataset load
%clear;
clc;

p = 200;
numTrainDat = 10000;
numTestDat = 200;
machNum = 1;
%lambdaGlasso = 3;

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

mut = mean(ttrain);
muf = mean(ftrain);
[b] = DiscovEstwithLocalMean(ttrain,ftrain,mut,muf,numTrainDat,machNum);
[theta,~] = graphicalLasso(b, lambdaGlasso, 100, 1e-4);
detheta = 2 * theta - theta * b * theta;
sparseBeta = detheta * (mut-muf)';

[accuracy, F1, precision, recall, F1Max, AccMax, tp, fp, prediction] = linearTest(sparseBeta,ttest,ftest,numTestDat);
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