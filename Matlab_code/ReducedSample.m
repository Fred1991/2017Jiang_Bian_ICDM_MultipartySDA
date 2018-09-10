function [rttrain,rftrain,numTrainDat] = ReducedSample(ttrain,ftrain,numTrainDat,reduceRate)
%rttrain = ttrain(1:numTrainDat*reduceRate,:);
rttrain = ttrain(1:numTrainDat-reduceRate,:);
%rftrain = ftrain(1:numTrainDat*reduceRate,:);
rftrain = ftrain(1:numTrainDat-reduceRate,:);
%numTrainDat = numTrainDat*reduceRate;
numTrainDat = numTrainDat-reduceRate;

