function [tDats,fDats,tMeans,fMeans] = dataSplit(tDat,fDat,datNum,machNum)
for i = 1:machNum 
    tDats(:,:,i) = tDat((i-1)*(floor(datNum/machNum))+1:i*(floor(datNum/machNum)),:);
    fDats(:,:,i) = fDat((i-1)*(floor(datNum/machNum))+1:i*(floor(datNum/machNum)),:);
    %botht(:,:,i) = vertcat(tt(:,:,i),ft(:,:,i));
    % meand
    tMeans(:,:,i) = mean(tDats(:,:,i));
    fMeans(:,:,i) = mean(fDats(:,:,i));
    % cov
    %b(:,:,i) = cov(botht(:,:,i));
   % tmean(:,:,i) = mean(tt(:,:,i));
   % fmean(:,:,i) = mean(ft(:,:,i));
  %  tcov(:,:,i) = (tt(:,:,i)-repmat(tmean(:,:,i),n/ma,1))'*(tt(:,:,i)-repmat(tmean(:,:,i),n/ma,1));
   % fcov(:,:,i) = (ft(:,:,i)-repmat(fmean(:,:,i),n/ma,1))'*(ft(:,:,i)-repmat(fmean(:,:,i),n/ma,1));
   % b(:,:,i) = tcov(:,:,i) + fcov(:,:,i);
    %b(:,:,i) = (botht(:,:,i)-repmat(mean(botht(:,:,i)),400,1))'*(botht(:,:,i)-repmat(mean(botht(:,:,i)),400,1));
end 
