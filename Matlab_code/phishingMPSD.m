%function [xopt, F1, precision, recall, F1Max, AccMax, AUC] = phishingMPSD(lambda,lambdaGlasso)
function [xopt, F1, precision, recall, F1Max, AccMax, AUC] = phishingMPSD(lambda,lambdaGlasso,numTrainDat)
%function [accuracy, F1, precision, recall] = Testbenchmark2(lambda,lambdaGlasso,numTrainDat)
%clc;
originalDat = readtable('raw-phishing.csv');


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

[mut,muf,niterr,dxx] = SGD_mu(mt,mf,machNum,p);

[b] = covEstwithGlobalMean(tt,ft,mut,muf,numTrainDat,machNum);

% De-sparsify glasso
for i=1:machNum
    [theta,~] = graphicalLasso(b(:,:,i), lambdaGlasso, 100, 1e-4);
    detheta(:,:,i) = 2 * theta - theta * b(:,:,i) * theta;
end

[xopt,niter,dx] = SGD2(detheta,(mut-muf)',machNum,lambda);

[accuracy, F1, precision, recall,F1Max,AccMax,tp,fp prediction] = linearTest(xopt,ttest,ftest,numTestDat);
%[accuracy, F1, precision, recall] = linearTestWithE0(xopt,ttest,ftest,numTestDat);

[xsorted, I] = sort(fp/numTestDat);
y = tp/numTestDat;
ysorted = y(I);
%plot(xsorted,ysorted);
AUC = trapz(xsorted,ysorted);
%scatter(fp/numTestDat,tp/numTestDat);