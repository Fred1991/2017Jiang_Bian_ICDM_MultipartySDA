T = readtable('newresults.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
x = [50, 100, 150, 200, 250, 300, 350, 400, 450, 500];

figure(1);hold on;
plot(x,slices{2}.Var2','-o','color','r');
plot(x,slices{1}.Var2','-s','color','c');
plot(x,slices{3}.Var2','-h','color','m');
plot(x,slices{4}.Var2','-^','color','b');
plot(x,slices{5}.Var2','-d','color','g');
L = legend('RWDA(200,10.0)','BayesLDA(200)','LDA','Log.Reg.','SVM','Location','NorthEastOutside');
set(L,'fontsize',15);
xlabel('Traning Set Size X2');
ylabel('Accuracy');

figure(2);hold on;
plot(x,slices{2}.Var3','-o','color','r');
plot(x,slices{1}.Var3','-s','color','c');
plot(x,slices{3}.Var3','-h','color','m');
plot(x,slices{4}.Var3','-^','color','b');
plot(x,slices{5}.Var3','-d','color','g');
L = legend('RWDA(200,10.0)','BayesLDA(200)','LDA','Log.Reg.','SVM','Location','NorthEastOutside');
set(L,'fontsize',15);
xlabel('Traning Set Size X2');
ylabel('F1-Score');




