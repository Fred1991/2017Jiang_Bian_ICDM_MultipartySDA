% X = 'ub-simulation-';
% Znew = 's-';
% for i=1:4
%     Y = num2str(i);
%     Z = [X,Y];
%     T = readtable(Z);
%     T.acc = (T.Var2 + T.Var3)./(T.Var2 + T.Var3 + T.Var4 + T.Var5);
%     T.f1 = (2 * T.Var2)./(2 * T.Var2 + T.Var4 + T.Var5);
%     func = @mean;
%     M = varfun(func,T,'GroupingVariables','Var1');
%     filename = [Znew,Y,'.txt'];
%     writetable(M,filename,'WriteVariableNames',false);
%     system(['copy/b sNew.txt+s-',Y,'.txt sNew.txt']);
% end

T = readtable('sNew.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
x = [10:10:40];
figure(1);hold on;
plot(x,slices{1}.Var9','--x','color','k');
plot(x,slices{2}.Var9','--o','color','b');
plot(x,slices{3}.Var9','-s','color','r','LineWidth',1.5);

[L,icons] = legend('LDA','SDA','DBSDA','Location','best');
set(L,'fontsize',20);
for k = 1:3
    icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%ylim([0.6 0.8]);
xlabel('Proportion of Positive Training/Testing Samples (%)');
ylabel('Accuracy');