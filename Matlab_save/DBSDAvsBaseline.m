T = readtable('Z1.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
x = [15, 30, 45, 60, 75, 90, 105, 120, 135, 150];

figure(1);hold on;
plot(x,slices{1}.Var9','--s','color','b');
plot(x,slices{2}.Var9','--o','color','b');
plot(x,slices{8}.Var9','-s','color','k');
plot(x,slices{9}.Var9','-o','color','k');
%plot(x,slices{16}.Var9','--d','color','b');
plot(x,slices{19}.Var9','-s','color','r','LineWidth',1.5);
plot(x,slices{21}.Var9','-o','color','r','LineWidth',1.5);
plot(x,slices{23}.Var9','-d','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var9','-h','color','k');
[L,icons] = legend('DTree(10)','DTree(20)','RFC(100)','RFC(50)','DBSDA(1.0)','DBSDA(2.0)','DBSDA(3.0)','Location','NorthEastOutside');
set(L,'fontsize',20);
for k = 1:7
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
xlim([15 150]);
xlabel('Traning Set Size X2');
ylabel('Accuracy');

T = readtable('Z2.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
x = [15, 30, 45, 60, 75, 90, 105, 120, 135, 150];

figure(2);hold on;
plot(x,slices{1}.Var9','--s','color','b');
plot(x,slices{2}.Var9','--o','color','b');
plot(x,slices{8}.Var9','-s','color','k');
plot(x,slices{9}.Var9','-o','color','k');
%plot(x,slices{16}.Var9','--d','color','b');
%plot(x,slices{17}.Var9','--d','color','k');
plot(x,slices{19}.Var9','-s','color','r','LineWidth',1.5);
plot(x,slices{21}.Var9','-o','color','r','LineWidth',1.5);
plot(x,slices{23}.Var9','-d','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var9','-h','color','k');
[L,icons] = legend('DTree(10)','DTree(20)','RFC(100)','RFC(50)','DBSDA(1.0)','DBSDA(2.0)','DBSDA(3.0)','Location','NorthEastOutside');
set(L,'fontsize',20);
for k = 1:7
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
xlim([15 150]);
xlabel('Traning Set Size X2');
ylabel('Accuracy');

T = readtable('Z3.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
x = [15, 30, 45, 60, 75, 90, 105, 120, 135, 150];

figure(3);hold on;
plot(x,slices{1}.Var9','--s','color','b');
plot(x,slices{2}.Var9','--o','color','b');
plot(x,slices{8}.Var9','-s','color','k');
plot(x,slices{9}.Var9','-o','color','k');
%plot(x,slices{16}.Var9','--d','color','b');
plot(x,slices{19}.Var9','-s','color','r','LineWidth',1.5);
plot(x,slices{21}.Var9','-o','color','r','LineWidth',1.5);
plot(x,slices{23}.Var9','-d','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var9','-h','color','k');
[L,icons] = legend('DTree(10)','DTree(20)','RFC(100)','RFC(50)','DBSDA(1.0)','DBSDA(2.0)','DBSDA(3.0)','Location','NorthEastOutside');
set(L,'fontsize',20);
for k = 1:7
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
xlim([15 150]);
xlabel('Traning Set Size X2');
ylabel('Accuracy');