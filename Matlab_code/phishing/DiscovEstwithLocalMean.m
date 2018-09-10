function [cov] = DiscovEstwithLocalMean(tDats,fDats,tMean,fMean,datNum,machNum)

tCov = machNum/datNum*(tDats-repmat(tMean,datNum/machNum,1))'*(tDats-repmat(tMean,datNum/machNum,1));
fCov = machNum/datNum*(fDats-repmat(fMean,datNum/machNum,1))'*(fDats-repmat(fMean,datNum/machNum,1));
cov = 0.5*tCov +  0.5*fCov;
   