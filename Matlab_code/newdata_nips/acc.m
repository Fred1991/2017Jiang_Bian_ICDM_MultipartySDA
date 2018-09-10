% X = 'accuracy-ehr-';
% Z = 'ehr-';
% for i=1:5
%     Y = num2str(50 + 100 * (i - 1));
%     Z = [X,Y,'-200-90'];
%     T = readtable(Z);
%     T.acc = (T.Var2 + T.Var3)./(T.Var2 + T.Var3 + T.Var4 + T.Var5);
%     T.f1 = (2 * T.Var2)./(2 * T.Var2 + T.Var4 + T.Var5);
%     func = @mean;
%     M = varfun(func,T,'GroupingVariables','Var1');
%     filename = [Z,Y,'.txt'];
%     writetable(M,filename,'WriteVariableNames',false);
%     system(['copy/b ehr.txt+ehr-',Y,'.txt ehr.txt']);
% end

T = readtable('ehr.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
x = [50, 150, 250, 350, 450];

figure(1);hold on;
plot(x,slices{1}.Var9','--s','color','b');
plot(x,slices{2}.Var9','--o','color','b');

plot(x,slices{3}.Var9','--s','color','k');
plot(x,slices{4}.Var9','--o','color','k');

plot(x,slices{5}.Var9','--o','color','c');

plot(x,slices{6}.Var9','--d','color','c');

plot(x,slices{7}.Var9','--s','color','c');

plot(x,slices{8}.Var9','--s','color','g');
plot(x,slices{9}.Var9','--o','color','g');
plot(x,slices{10}.Var9','--d','color','g');

plot(x,slices{11}.Var9','--s','color','y');
plot(x,slices{12}.Var9','--o','color','y');

plot(x,slices{13}.Var9','-s','color','b');
plot(x,slices{15}.Var9','-o','color','b');
plot(x,slices{17}.Var9','-d','color','b');

%plot(x,slices{16}.Var9','--d','color','b');
plot(x,slices{18}.Var9','-s','color','r','LineWidth',1.5);
plot(x,slices{20}.Var9','-o','color','r','LineWidth',1.5);
plot(x,slices{22}.Var9','-d','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var9','-h','color','k');
[L,icons] = legend('Adaboost(100.0)','Adaboost(200.0)','DTree(10.0)','DTree(20.0)','LDA','LR','LSVM','NSVM(0.1)','NSVM(1.0)','RFC(100)','RFC(200)','NSVM(10.0)','SDA(1.0)','SDA(2.0)','SDA(3.0)','DBSDA(1.0)','DBSDA(2.0)','DBSDA(3.0)','Location','NorthEastOutside');
set(L,'fontsize',20);
for k = 1:18
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
xlabel('Traning Set Size X2');
ylabel('Accuracy');

figure(2);hold on;
plot(x,slices{1}.Var10','--s','color','b');
plot(x,slices{2}.Var10','--o','color','b');

plot(x,slices{3}.Var10','--s','color','k');
plot(x,slices{4}.Var10','--o','color','k');

plot(x,slices{5}.Var10','--o','color','c');

plot(x,slices{6}.Var10','--d','color','c');

plot(x,slices{7}.Var10','--s','color','c');

plot(x,slices{8}.Var10','--s','color','g');
plot(x,slices{9}.Var10','--o','color','g');
plot(x,slices{10}.Var10','--d','color','g');

plot(x,slices{11}.Var10','--s','color','y');
plot(x,slices{12}.Var10','--o','color','y');

plot(x,slices{13}.Var10','-s','color','b');
plot(x,slices{15}.Var10','-o','color','b');
plot(x,slices{17}.Var10','--d','color','b');

%plot(x,slices{16}.Var9','--d','color','b');
plot(x,slices{18}.Var10','-s','color','r','LineWidth',1.5);
plot(x,slices{20}.Var10','-o','color','r','LineWidth',1.5);
plot(x,slices{22}.Var10','-d','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var9','-h','color','k');
[L,icons] = legend('Adaboost(100.0)','Adaboost(200.0)','DTree(10.0)','DTree(20.0)','LDA','LR','LSVM','NSVM(0.1)','NSVM(1.0)','RFC(100)','RFC(200)','NSVM(10.0)','SDA(1.0)','SDA(2.0)','SDA(3.0)','DBSDA(1.0)','DBSDA(2.0)','DBSDA(3.0)','Location','NorthEastOutside');
set(L,'fontsize',20);
for k = 1:18
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
xlabel('Traning Set Size X2');
ylabel('F1-Score');