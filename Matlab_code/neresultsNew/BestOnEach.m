T = readtable('s.txt');
%slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
x = [20:20:200];
sda = zeros(10,1);
dbsda = zeros(10,1);
lda = zeros(10,1);
for i=1:10
    sda(i)= max(T.Var9(3+(i-1)*24:13+(i-1)*24));
    dbsda(i)= max(T.Var9(14+(i-1)*24:24+(i-1)*24));
    lda(i)= T.Var9(1+(i-1)*24);
end

figure(1);hold on;
plot(x,sda,'--d','color','b');
plot(x,dbsda,'-o','color','r','LineWidth',1.5);
%plot(x,lda,'--s','color','k');

% [L,icons] = legend('LDA','Optimal','SDA(1.0)','SDA(1024.0)','SDA(128.0)','SDA(16.0)','SDA(2.0)','SDA(256.0)','SDA(32.0)'...
%     ,'SDA(512.0)','SDA(4.0)','SDA(64.0)','SDA(8.0)','DBSDA(1.0)','DBSDA(1024.0)','DBSDA(128.0)','DBSDA(16.0)','DBSDA(2.0)','DBSDA(256.0)','DBSDA(32.0)'...
%     ,'SDA(4.0)','DBSDA(512.0)','DBSDA(64.0)','DBSDA(8.0)','Location','NorthEastOutside');
[L,icons] = legend('SDA','DBSDA','Location','best');
set(L,'fontsize',20);
for k = 1:2
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
ylim([0.625 0.76]);
xlabel('Traning Set Size');
ylabel('Accuracy');