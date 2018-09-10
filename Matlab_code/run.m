clear;
clc;
gapSGD = 1;
gapGlasso = 0.1;
sizeGlasso = 10;
sizeSGD = 5;

% initialize
AUC = zeros(sizeGlasso,sizeSGD);
accMax = zeros(sizeGlasso,sizeSGD);
f1Max = zeros(sizeGlasso,sizeSGD);
xOpt = cell(sizeGlasso,sizeSGD);
cellPrecision = cell(sizeGlasso,sizeSGD);
cellRecall = cell(sizeGlasso,sizeSGD);
cellF1 = cell(sizeGlasso,sizeSGD);

%Tune on MPSDA
for k = 1:sizeGlasso 
    for i = 1:sizeSGD 
       [xOpt{k,i}, cellF1{k,i}, cellPrecision{k,i}, cellRecall{k,i}, f1Max(k,i), accMax(k,i), AUC(k,i)] = spliceMPSD(1 + (i - 1) * gapSGD,0.1 + (k - 1) * gapGlasso);   
    end
end


%plot(index,accmax);





