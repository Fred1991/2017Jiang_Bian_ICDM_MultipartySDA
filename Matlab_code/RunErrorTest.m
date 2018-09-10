%numTrainDat = 10000;
num = 5;
rep = 5;
%initialize
disI = zeros(rep,1);
multiI = zeros(rep,1);
dsI = zeros(rep,1);
dis2 = zeros(rep,1);
multi2 = zeros(rep,1);
ds2 = zeros(rep,1);

DisbarI = zeros(num,1);
MulbarI = zeros(num,1);
DsbarI = zeros(num,1);
Disbar2 = zeros(num,1);
Mulbar2 = zeros(num,1);
Dsbar2 = zeros(num,1);
meandisI = zeros(num,1);
meanmultiI = zeros(num,1);
meandsI = zeros(num,1);
meandis2 = zeros(num,1);
meanmulti2 = zeros(num,1);
meands2 = zeros(num,1);

for i=1:num
    numTrainDat = 10000;
    for j=1:rep
        if i==3
            numTrainDat=10020;
        end
    [disI(j),multiI(j),dsI(j),dis2(j),multi2(j),ds2(j)] = newErrorTest(numTrainDat,20 + (i-1)*20);
    end
    DisbarI(i) = std(disI);
    MulbarI(i) = std(multiI);
    DsbarI(i) = std(dsI);
    Disbar2(i) = std(dis2);
    Mulbar2(i) = std(multi2);
    Dsbar2(i) = std(ds2);
    meandisI(i) = mean(disI);
    meanmultiI(i) = mean(multiI);
    meandsI(i) = mean(dsI);
    meandis2(i) = mean(dis2);
    meanmulti2(i) = mean(multi2);
    meands2(i) = mean(ds2);
end