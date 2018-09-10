T = readtable('Z2.txt');
%Tstd = readtable('Z1newSTD.txt');
% Tmax = readtable('Z1newMax.txt');
% Tmin = readtable('Z1newMin.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
%slicesSTD = cellfun(@(value) Tstd(strcmp(Tstd.Var1,value),:), unique(Tstd.Var1),'UniformOutput',false);
% slicesP = cellfun(@(value) Tmax(strcmp(Tmax.Var1,value),:), unique(Tmax.Var1),'UniformOutput',false);
% slicesN = cellfun(@(value) Tmin(strcmp(Tmin.Var1,value),:), unique(Tmin.Var1),'UniformOutput',false);
x = [30:30:120];

figure(1);hold on;
plot(x,slices{11}.Var9','--o','color','b');
plot(x,slices{19}.Var9','-s','color','r','LineWidth',1.5);
%errorbar(x,slices{11}.Var9',slicesSTD{11}.Var9','--s','color','b');
%errorbar(x,slices{19}.Var9',slicesSTD{19}.Var9','-s','color','r','LineWidth',1.5);
plot(x,slices{17}.Var9','--p','color','k');
plot(x,slices{3}.Var9','--s','color','k');
[L,icons] = legend('SDA','DBSDA','Ye-LDA','LDA','Location','NorthEastOutside');
set(L,'fontsize',20);
for k = 1:4
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
xlabel('Traning Set Size');
ylabel('Accuracy');

T = readtable('Z3.txt');
%Tstd = readtable('Z1newSTD.txt');
% Tmax = readtable('Z1newMax.txt');
% Tmin = readtable('Z1newMin.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
%slicesSTD = cellfun(@(value) Tstd(strcmp(Tstd.Var1,value),:), unique(Tstd.Var1),'UniformOutput',false);
% slicesP = cellfun(@(value) Tmax(strcmp(Tmax.Var1,value),:), unique(Tmax.Var1),'UniformOutput',false);
% slicesN = cellfun(@(value) Tmin(strcmp(Tmin.Var1,value),:), unique(Tmin.Var1),'UniformOutput',false);
x = [30:30:120];

figure(2);hold on;
plot(x,slices{11}.Var9','--o','color','b');
plot(x,slices{19}.Var9','-s','color','r','LineWidth',1.5);
%errorbar(x,slices{11}.Var9',slicesSTD{11}.Var9','--s','color','b');
%errorbar(x,slices{19}.Var9',slicesSTD{19}.Var9','-s','color','r','LineWidth',1.5);
plot(x,slices{17}.Var9','--p','color','k');
plot(x,slices{3}.Var9','--s','color','k');
[L,icons] = legend('SDA','DBSDA','Ye-LDA','LDA','Location','NorthEastOutside');
set(L,'fontsize',20);
for k = 1:4
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
xlabel('Traning Set Size');
ylabel('Accuracy');
% T = readtable('Z2.txt');
% slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
% x = [15, 30, 45, 60, 75, 90, 105, 120, 135, 150];

% figure(2);hold on;
% plot(x,slices{11}.Var9','--s','color','b');
% plot(x,slices{13}.Var9','--o','color','b');
% plot(x,slices{15}.Var9','--d','color','b');
% plot(x,slices{19}.Var9','-s','color','r','LineWidth',1.5);
% plot(x,slices{21}.Var9','-o','color','r','LineWidth',1.5);
% plot(x,slices{23}.Var9','-d','color','r','LineWidth',1.5);
% plot(x,slices{17}.Var9','--h','color','k');
% plot(x,slices{3}.Var9','--s','color','k');
% [L,icons] = legend('SDA(1.0)','SDA(2.0)','SDA(3.0)','DBSDA(1.0)','DBSDA(2.0)','DBSDA(3.0)','Ye-LDA','LDA','Location','NorthEastOutside');
% set(L,'fontsize',20);
% for k = 1:8
% icons(k).FontSize = 16;
% end
% set(gca,'FontSize',20);
% xlim([15 150]);
% xlabel('Traning Set Size X2');
% ylabel('Accuracy');
% 
% T = readtable('Z3.txt');
% slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
% x = [15, 30, 45, 60, 75, 90, 105, 120, 135, 150];
% 
% figure(3);hold on;
% plot(x,slices{11}.Var9','--s','color','b');
% plot(x,slices{13}.Var9','--o','color','b');
% plot(x,slices{15}.Var9','--d','color','b');
% plot(x,slices{19}.Var9','-s','color','r','LineWidth',1.5);
% plot(x,slices{21}.Var9','-o','color','r','LineWidth',1.5);
% plot(x,slices{23}.Var9','-d','color','r','LineWidth',1.5);
% plot(x,slices{17}.Var9','--h','color','k');
% plot(x,slices{3}.Var9','--s','color','k');
% [L,icons] = legend('SDA(1.0)','SDA(2.0)','SDA(3.0)','DBSDA(1.0)','DBSDA(2.0)','DBSDA(3.0)','Ye-LDA','LDA','Location','NorthEastOutside');
% set(L,'fontsize',20);
% for k = 1:8
% icons(k).FontSize = 16;
% end
% set(gca,'FontSize',20);
% xlim([15 150]);
% xlabel('Traning Set Size X2');
% ylabel('Accuracy');