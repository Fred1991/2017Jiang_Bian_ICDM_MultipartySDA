function [cov] = covEstwithGlobalMean(tDats,fDats,tMean, fMean,datNum,machNum)

for i = 1:machNum 
   tCov(:,:,i) = machNum/datNum*(tDats(:,:,i)-repmat(tMean',datNum/machNum,1))'*(tDats(:,:,i)-repmat(tMean',datNum/machNum,1));
   fCov(:,:,i) = machNum/datNum*(fDats(:,:,i)-repmat(fMean',datNum/machNum,1))'*(fDats(:,:,i)-repmat(fMean',datNum/machNum,1));
   cov(:,:,i) = 0.5*tCov(:,:,i) +  0.5*fCov(:,:,i);
end 

