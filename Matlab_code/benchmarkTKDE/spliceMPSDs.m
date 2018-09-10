%function [xopt, F1, precision, recall, F1Max, AccMax, AUC] = spliceMPSD(lambda,lambdaGlasso)
function [xopt, F1, precision, recall, F1Max, AccMax, AUC] = spliceMPSDs(lambda,lambdaGlasso,numTrainDat,S)
%function [accuracy, F1, precision, recall] = Testbenchmark2(lambda,lambdaGlasso,numTrainDat)
%clc;
originalDat = readtable('raw-splice.csv');


% balance and subsample
frows = eq(originalDat.label,0);
trows = eq(originalDat.label,1);
fDat = originalDat(frows,:);
tDat = originalDat(trows,:);


p = size(originalDat,2)-1;
%numTrainDat = 1000;
numTestDat = 200;
machNum = 4;
%lambda = 11;
%lambdaGlasso = 1;

% testing sample 
ttesting = tDat(end-(numTestDat-1):end,:);
ftesting = fDat(end-(numTestDat-1):end,:);
ttesting(:,p+1) = [];
ftesting(:,p+1) = [];
ttest = table2array(ttesting);
ftest = table2array(ftesting);


% training sample
ttrain = tDat(1:numTrainDat,:);
ftrain = fDat(1:numTrainDat,:);
ttrain(:,p+1) = [];
ftrain(:,p+1) = [];
ttrain = table2array(ttrain);
ftrain = table2array(ftrain);

[tt,ft,mt,mf]=dataSplit(ttrain,ftrain,numTrainDat,machNum);

muts = zeros(p,1);
mufs = zeros(p,1);
for i=1:S
    [mut,muf,niterr,dxx] = SGD_mu(mt,mf,machNum,p);
    muts = muts + mut;
    mufs = mufs + muf;
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
    [xopt,niter,dx] = SGD2(detheta,(mut-muf)',machNum,lambda);
    xopts = xopts + xopt;
end
xopts = xopts/S;
    
[accuracy, F1, precision, recall,F1Max,AccMax,tp,fp prediction] = linearTest(xopts,ttest,ftest,numTestDat);
%[accuracy, F1, precision, recall] = linearTestWithE0(xopt,ttest,ftest,numTestDat);

[xsorted, I] = sort(fp/numTestDat);
y = tp/numTestDat;
ysorted = y(I);
%plot(xsorted,ysorted);
AUC = trapz(xsorted,ysorted);
%scatter(fp/numTestDat,tp/numTestDat);