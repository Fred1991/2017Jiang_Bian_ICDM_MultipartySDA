T = readtable('accuracy-adult1-50-200-90.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
k=0;

for i=1:size(slices,1)
    if strcmp(slices{i}.Var1(1),'MC_BayesLDA-100-10-1.0')
        k=k+1;
    end
end