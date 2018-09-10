n=5;
k=5;
lambda = 13;
lambdaGlasso = 3;
multiacc = cell(k,n);multiF1 = cell(k,n);multif1Max = zeros(k,n);multiaccMax = zeros(k,n);multiAUC = zeros(k,n);multiTp = cell(k,n);multiFp = cell(k,n);
disacc = cell(k,n);disF1 = cell(k,n);disf1Max = zeros(k,n);disaccMax = zeros(k,n);disAUC = zeros(k,n);disTp = cell(k,n);disFp = cell(k,n);
sparseacc = cell(k,n);sF1 = cell(k,n);sf1Max = zeros(k,n);saccMax = zeros(k,n);sAUC = zeros(k,n);dsTp = cell(k,n);dsFp = cell(k,n);
for j=3:3
    for i=1:n
    [multiacc{j,i}, multiF1{j,i}, multif1Max(j,i), multiaccMax(j,i), multiAUC(j,i), multiTp{j,i}, multiFp{j,i}] = test60s(lambda,lambdaGlasso,20+(j-1)*20,10);
    [disacc{j,i}, disF1{j,i}, disf1Max(j,i), disaccMax(j,i), disAUC(j,i), disTp{j,i}, disFp{j,i}] = testDis60(lambdaGlasso,20+(j-1)*20);
    [sparseacc{j,i}, sF1{j,i}, sf1Max(j,i), saccMax(j,i), sAUC(j,i), dsTp{j,i}, dsFp{j,i}] = testDS60(0.1);
    end
end