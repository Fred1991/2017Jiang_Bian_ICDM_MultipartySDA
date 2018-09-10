function [disErrorInf,multiErrorInf,dsErrorInf,disError2,multiError2,dsError2] = newErrorTest(numTrainDat,machNum)
% dataset load
%clear;
%clc;

p = 200;
%numTrainDat = 10000;
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

[tt,ft,mt,mf]=dataSplit(ttrain,ftrain,numTrainDat,machNum);

%optimal 
theta_star = 1\cov; 
beta_star = theta_star * (mttrain-mftrain);

%Dsparse
mut = mean(ttrain);
muf = mean(ftrain);
[b] = DiscovEstwithLocalMean(ttrain,ftrain,mut,muf,numTrainDat,1);%for dsparse, machNum=1
[theta,~] = graphicalLasso(b, 0.1, 100, 1e-4);
detheta = 2 * theta - theta * b * theta;
sparseBeta = detheta * (mut-muf)';

%distributed
temp = zeros(p,1); 
for i=1:machNum
    mut_1 = mean(tt(:,:,i));
    muf_1 = mean(ft(:,:,i));
    [b_1] = DiscovEstwithLocalMean(tt(:,:,i),ft(:,:,i),mut_1,muf_1,numTrainDat,machNum);
    [theta,~] = graphicalLasso(b_1, 3, 100, 1e-4);
    detheta = 2 * theta - theta * b_1 * theta;
    temp = temp + detheta * (mut_1-muf_1)';
end
disBeta = temp / machNum;

%multiparty
[mut_2,muf_2,niterr,dxx] = SGD_mu(mt,mf,machNum,p);
[b_2] = covEstwithGlobalMean(tt,ft,mut_2,muf_2,numTrainDat,machNum);
for i=1:machNum
    [theta,~] = graphicalLasso(b_2(:,:,i), 3, 100, 1e-4);
    detheta(:,:,i) = 2 * theta - theta * b_2(:,:,i) * theta;
end
[Beta,niter,dx] = SGD2(detheta,(mut_2-muf_2)',machNum,13);


disErrorInf = norm(disBeta-beta_star,inf);
multiErrorInf = norm(Beta-beta_star,inf);
dsErrorInf = norm(sparseBeta-beta_star,inf);

disError2 = norm(disBeta-beta_star,2);
multiError2 = norm(Beta-beta_star,2);
dsError2 = norm(sparseBeta-beta_star,2);