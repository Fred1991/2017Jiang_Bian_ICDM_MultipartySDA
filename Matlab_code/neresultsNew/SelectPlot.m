T = readtable('s.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
x = [20:20:200];

figure(1);hold on;
%plot(x,slices{1}.Var9','-s','color','k');
%plot(x,slices{2}.Var9','-o','color','k');

% plot(x,slices{3}.Var9','--o','color','b');
% plot(x,slices{4}.Var9','--+','color','b');
% plot(x,slices{5}.Var9','--*','color','b');
% plot(x,slices{6}.Var9','--.','color','b');
% plot(x,slices{7}.Var9','--x','color','b');
% plot(x,slices{8}.Var9','--s','color','b');
plot(x,slices{9}.Var9','--d','color','b');
% plot(x,slices{10}.Var9','--p','color','b');
% plot(x,slices{11}.Var9','--h','color','b');
% plot(x,slices{12}.Var9','--<','color','b');
% plot(x,slices{13}.Var9','->','color','b');

% plot(x,slices{14}.Var9','-o','color','r','LineWidth',1.5);
% plot(x,slices{15}.Var9','-+','color','r','LineWidth',1.5);
% plot(x,slices{16}.Var9','-*','color','r','LineWidth',1.5);
plot(x,slices{17}.Var9','-x','color','r','LineWidth',1.5);
% plot(x,slices{18}.Var9','-x','color','r','LineWidth',1.5);
% plot(x,slices{19}.Var9','-s','color','r','LineWidth',1.5);
% plot(x,slices{20}.Var9','-d','color','r','LineWidth',1.5);
% plot(x,slices{21}.Var9','-p','color','r','LineWidth',1.5);
% plot(x,slices{22}.Var9','-h','color','r','LineWidth',1.5);
% plot(x,slices{23}.Var9','-<','color','r','LineWidth',1.5);
%plot(x,slices{24}.Var9','-p','color','r','LineWidth',1.5);

% [L,icons] = legend('LDA','Optimal','SDA(1.0)','SDA(1024.0)','SDA(128.0)','SDA(16.0)','SDA(2.0)','SDA(256.0)','SDA(32.0)'...
%     ,'SDA(512.0)','SDA(4.0)','SDA(64.0)','SDA(8.0)','DBSDA(1.0)','DBSDA(1024.0)','DBSDA(128.0)','DBSDA(16.0)','DBSDA(2.0)','DBSDA(256.0)','DBSDA(32.0)'...
%     ,'SDA(4.0)','DBSDA(512.0)','DBSDA(64.0)','DBSDA(8.0)','Location','NorthEastOutside');
[L,icons] = legend('SDA(32.0)','DBSDA(16.0)','Location','best');
set(L,'fontsize',20);
for k = 1:2
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%ylim([0.6 0.8]);
xlabel('Traning Set Size');
ylabel('Accuracy');