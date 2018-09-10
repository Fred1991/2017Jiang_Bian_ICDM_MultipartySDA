clear;
clc;
gapGlasso = 0.01;
sizeGlasso = 10;

% initialize
AUC = zeros(sizeGlasso,1);
accMax = zeros(sizeGlasso,1);
f1Max = zeros(sizeGlasso,1);
sparseBeta = cell(sizeGlasso);
cellPrecision = cell(sizeGlasso);
cellRecall = cell(sizeGlasso);
cellF1 = cell(sizeGlasso);

for k = 1:sizeGlasso  
    [sparseBeta{k}, cellF1{k}, cellPrecision{k}, cellRecall{k}, f1Max(k), accMax(k), AUC(k)] = DsparseLDA(0.01 + gapGlasso * (k-1));   
end
