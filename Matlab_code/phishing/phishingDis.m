%function [disBeta, F1, precision, recall, F1Max, AccMax, AUC] = phishingDis(lambdaGlasso)
function [disBeta, F1, precision, recall, F1Max, AccMax, AUC] = phishingDis(lambdaGlasso,numTrainDat)
%function [accuracy, F1, precision, recall] = benchmarkDis(lambdaGlasso,numTrainDat)
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
machNum = 10;
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

temp = zeros(p,1); 
for i=1:machNum
    mut = mean(tt(:,:,i));
    muf = mean(ft(:,:,i));
    [b] = DiscovEstwithLocalMean(tt(:,:,i),ft(:,:,i),mut,muf,numTrainDat,machNum);
    [theta,~] = graphicalLasso(b, lambdaGlasso, 100, 1e-4);
    detheta = 2 * theta - theta * b * theta;
    temp = temp + detheta * (mut-muf)';
    disp(['dis glasso ',num2str(i),' run finished.']);
end

disBeta = temp / machNum;

[accuracy, F1, precision, recall, F1Max, AccMax, tp, fp, prediction] = linearTest(disBeta,ttest,ftest,numTestDat);
%[accuracy, F1, precision, recall] = linearTestWithE0(disBeta,ttest,ftest,numTestDat);
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