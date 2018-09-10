%function acc = Test(ep)
% dataset load
clear;
clc;
originalDat = readtable('code_matrix.csv');
originalDat(:,1) = [];

% balance and subsample
frows = strcmp(originalDat.mental_disorder,'False');
trows = strcmp(originalDat.mental_disorder,'True');
fDat = originalDat(frows,:);
tDat = originalDat(trows,:);


p = 255;
numTrainDat = 4000;
numTestDat = 200;
machNum = 100;
lambda = 0.0;

% testing sample & training sample
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

[xopt,niter,dx] = SGD2(b,(mut-muf)',machNum,lambda);

[accuracy, F1, precision, recall,F1Max,AccMax,tp,fp prediction] = linearTest(xopt,ttest,ftest,numTestDat);

scatter(fp/numTestDat,tp/numTestDat);


%realLabel=vertcat(ones(numTestDat,1),zeros(numTestDat,1));
%for i=1:2*numTestDat
%    CP(i) = classperf(realLabel, prediction(i));
%end

