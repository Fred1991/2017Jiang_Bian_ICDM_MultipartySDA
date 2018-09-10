function [ttrain,ftrain,ttest,ftest,numTestDat,mftrain,mttrain,lambdaGlasso,cov] = additionalTest2(numTrainDat)
% dataset load
%clear;
%clc;

p = 200;
%numTrainDat = 50;
numTestDat = 200;
%machNum = 1;
%lambda = 10;
lambdaGlasso = 10;

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
