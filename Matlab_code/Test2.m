% dataset load
M = readtable('adult.txt');
M(:,[2,4,6,7,8,9,10,11,12,14]) = [];

% balance and subsample
frows = strcmp(M.Var15,'<=50K');
trows = strcmp(M.Var15,'>50K');
f = M(frows,:);
t = M(trows,:);

% testing sample & training sample
ttesting = t(end-499:end,:);
ftesting = f(end-499:end,:);
testing = vertcat(ftesting,ttesting);
label = testing(:,5);
label = table2array(label);
testing(:,5) = [];
tmat = table2array(testing);


% training sample
ttrain = t(1:2000,:);
ftrain = f(1:2000,:);
mnumber = 10;
ttrain(:,5) = [];
ftrain(:,5) = [];
ttrain = table2array(ttrain);
ftrain = table2array(ftrain);

% predifine
tt = zeros(200,4,10);
ft = zeros(200,4,10);
m = zeros(1,4,10);
tmean = zeros(1,4,10);
fmean = zeros(1,4,10);
tcov = zeros(4,4,10);
fcov = zeros(4,4,10);
b = zeros(4,4,10);

for i = 1:mnumber 
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
%{
x = zeros(1,253);
for q = 1:mnumber 
    x = x + m(:,:,i);
end
meand = x / mnumber;
%}


%b(:,:,number)=[];
%{
for i = 1:number
    findex = randsample(1:height(f), s);
    frs = f(findex,:);
    tindex = randsample(1:height(t), s);
    trs = t(tindex,:);
    rs = vertcat(frs,trs);
    % meand
    frs(:,254) = [];
    trs(:,254) = [];
    mfrs = table2array(frs);
    mtrs = table2array(trs);
    m(:,:,i) = mean(mtrs)-mean(mfrs);
    % covarinace matrix
    rs(:,254) = [];
    mat = table2array(rs);
    % 
    %c = cov(mat);
    c = (mat-repmat(mean(mat),s*2,1))'*(mat-repmat(mean(mat),s*2,1));
    %c3 = c - c1;
    %
    %
    b(:,:,i) = c;

end
%}
%meand = reshape(mean(m),253,1);
mud = SGD_mu(m,mnumber);
[xopt,niter,dx] = SGD2(b,mud',mnumber);


%{
% classify
% testing sample
tt = 500;
tfindex = randsample(1:height(f), tt);
tfrs = f(tfindex,:);
ttindex = randsample(1:height(t), tt);
ttrs = t(ttindex,:);
trs = vertcat(tfrs,ttrs);
label = trs(:,254);
label = table2array(label);
trs(:,254) = [];
tmat = table2array(trs);
%}

% predict
count = 0;
predicted = tmat * xopt;
for i=1:1000
    if predicted(i)>0 && strcmp(label(i),'>50K')
        count = count + 1;
    elseif predicted(i)<=0 && strcmp(label(i),'<=50K')
        count = count + 1;
    end
end

count3 = 0;
alltrain = vertcat(ftrain,ttrain);
mftrain = mean(ftrain);
mttrain = mean(ttrain);
ttcov = (ttrain-repmat(mttrain,2000,1))'*(ttrain-repmat(mttrain,2000,1));
tfcov = (ftrain-repmat(mftrain,2000,1))'*(ftrain-repmat(mftrain,2000,1));
covall = ttcov + tfcov;

predicted3 = (tmat - repmat(mean(tmat),1000,1)) * pinv(covall) * (mttrain-mftrain)';
for i=1:1000
    if predicted3(i)>0 && strcmp(label(i),'>50K')
        count3 = count3 + 1;
    elseif predicted3(i)<=0 && strcmp(label(i),'<=50K')
        count3 = count3 + 1;
    end
end
% ROC
maxp = max(predicted);
minp = min(predicted);
gaps = 1000;
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
        if pre(a,i)>0 && strcmp(label(a),'>50K')
            count2(i) = count2(i) + 1;
        else if pre(a,i)<0 && strcmp(label(a),'<=50K');
            count2(i) = count2(i) + 1;
            end
        end
    end
    for j=1:1000
        if pre(j,i) >0 && strcmp(label(j),'>50K')
            tp = tp + 1;
        elseif pre(j,i) >0 && strcmp(label(j),'<=50K')
            fp = fp + 1;
        end
    end
    tpr(i) = tp / 500;
    fpr(i) = fp / 500;
end

plot(fpr,tpr);
xlabel('False positive rate (Fall-out)');
ylabel('True positive rate (Sensitivity, Recall)');
title('ROC Curve');