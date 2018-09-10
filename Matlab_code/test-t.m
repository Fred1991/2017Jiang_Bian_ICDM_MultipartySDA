% dataset load
clear
clc

mftrain = rand(20,1);
mttrain = rand(20,1);

ttrain=mvnrnd(mttrain,eye(20,20),2000);
ftrain=mvnrnd(mftrain,eye(20,20),2000);
ttest=mvnrnd(mttrain,eye(20,20),500);
ftest=mvnrnd(mftrain,eye(20,20),500);


for i = 1:number 
    tt(:,:,i) = ttrain((i-1)*(2000/10)+1:i*(2000/10),:);
    ft(:,:,i) = ftrain((i-1)*(2000/10)+1:i*(2000/10),:);
    %botht(:,:,i) = vertcat(tt(:,:,i),ft(:,:,i));
    % meand
    m(:,:,i) = mean(tt(:,:,i))-mean(ft(:,:,i));
    % cov
    %b(:,:,i) = cov(botht(:,:,i));
    tmean(:,:,i) = mean(tt(:,:,i));
    fmean(:,:,i) = mean(ft(:,:,i));
    tcov(:,:,i) = (tt(:,:,i)-repmat(tmean(:,:,i),200,1))'*(tt(:,:,i)-repmat(tmean(:,:,i),200,1));
    fcov(:,:,i) = (ft(:,:,i)-repmat(fmean(:,:,i),200,1))'*(ft(:,:,i)-repmat(fmean(:,:,i),200,1));
    b(:,:,i) = tcov(:,:,i) + fcov(:,:,i);
    %b(:,:,i) = (botht(:,:,i)-repmat(mean(botht(:,:,i)),400,1))'*(botht(:,:,i)-repmat(mean(botht(:,:,i)),400,1));
end 


[mud,niterr,dxx] = SGD_mu(m,number);
[xopt,niter,dx] = SGD2(b,mud',number);

count = 0;
predicted = (tmat - repmat(mean(tmat),1000,1)) * xopt;
for i=1:1000
    if predicted(i)-5>0 && strcmp(label(i),'True')
        count = count + 1;
    elseif predicted(i)-5<=0 && strcmp(label(i),'False')
        count = count + 1;
    end
end

count3 = 0;
predicted3 = (tmat - repmat(0.5*mttrain+0.5*mftrain,1000,1)) * eye(20,20) * (mttrain-mftrain)';
for i=1:1000
    if predicted3(i)>0 && strcmp(label(i),'True')
        count3 = count3 + 1;
    elseif predicted3(i)<=0 && strcmp(label(i),'False')
        count3 = count3 + 1;
    end
end
% ROC
maxp = max(predicted);
minp = min(predicted);
gaps = 1e3;
g = (maxp - minp)/gaps;
pre = zeros(size(predicted,1),gaps);
for i=1:gaps 
    pre(:,i) = predicted + (i-1)*g - maxp;
end


tpr = zeros(1,gaps);
fpr = zeros(1,gaps);
count2 = zeros(1,gaps);
for i=1:gaps 
    tp = 0;
    fp = 0;
    for a=1:1000 
        if pre(a,i)>0 && strcmp(label(a),'True')
            count2(i) = count2(i) + 1;
        else if pre(a,i)<0 && strcmp(label(a),'False');
            count2(i) = count2(i) + 1;
            end
        end
    end
    for j=1:1000
        if pre(j,i) >0 && strcmp(label(j),'True')
            tp = tp + 1;
        elseif pre(j,i) >0 && strcmp(label(j),'False')
            fp = fp + 1;
        end
    end
    tpr(i) = tp / 500;
    fpr(i) = fp / 500;
end

maxv = max(count2);
plot(fpr,tpr);
xlabel('False positive rate (Fall-out)');
ylabel('True positive rate (Sensitivity, Recall)');
title('ROC Curve');
