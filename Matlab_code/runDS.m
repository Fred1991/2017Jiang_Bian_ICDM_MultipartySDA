clear;
clc;
gapGlasso = 0.1;
sizeGlasso = 10;


% initialize
AUC = zeros(sizeGlasso,1);
accMax = zeros(sizeGlasso,1);
f1Max = zeros(sizeGlasso,1);
xOpt = cell(sizeGlasso,1);
cellPrecision = cell(sizeGlasso,1);
cellRecall = cell(sizeGlasso,1);
cellF1 = cell(sizeGlasso,1);

for k = 1:sizeGlasso 
       [xOpt{k,1}, cellF1{k,1}, cellPrecision{k,1}, cellRecall{k,1}, f1Max(k,1), accMax(k,1), AUC(k,1)] = spliceDS(0.1 + (k - 1) * gapGlasso);   
end