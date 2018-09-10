%function [sparseBeta, F1, precision, recall, F1Max, AccMax, AUC] = phishingDS(lambdaGlasso)
function [sparseBeta, F1, precision, recall, F1Max, AccMax, AUC] = phishingDS(lambdaGlasso,numTrainDat)
%function [accuracy, F1, precision, recall] = phishingDS(lambdaGlasso,numTrainDat)
% dataset load
%clear;
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
machNum = 1;
% lambdaGlasso = 0.3;

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

mut = mean(ttrain);
muf = mean(ftrain);
[b] = DiscovEstwithLocalMean(ttrain,ftrain,mut,muf,numTrainDat,machNum);
[theta,~] = graphicalLasso(b, lambdaGlasso, 100, 1e-4);
detheta = 2 * theta - theta * b * theta;
sparseBeta = detheta * (mut-muf)';
disp(['ds glasso run finished.']);

[accuracy, F1, precision, recall, F1Max, AccMax, tp, fp, prediction] = linearTest(sparseBeta,ttest,ftest,numTestDat);
%[accuracy, F1, precision, recall] = linearTestWithE0(sparseBeta,ttest,ftest,numTestDat);
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