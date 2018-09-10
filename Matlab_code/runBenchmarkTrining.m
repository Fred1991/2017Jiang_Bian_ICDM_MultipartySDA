
f1Max1 = zeros(10,1);
accMax1 = zeros(10,1);
AUC1 = zeros(10,1);
f1Max2 = zeros(10,1);
accMax2 = zeros(10,1);
AUC2 = zeros(10,1);
f1Max3 = zeros(10,1);
accMax3 = zeros(10,1);
AUC3 = zeros(10,1);
for i=1:10
    [~, ~, ~, ~, f1Max1(i), accMax1(i), AUC1(i)] = Testbenchmark2(11,1,100+100*(i-1));
    [~, ~, ~, ~, f1Max2(i), accMax2(i), AUC2(i)] = benchmarkDS(0.5,100+100*(i-1));
    [~, ~, ~, ~, f1Max3(i), accMax3(i), AUC3(i)] = benchmarkDis(1,100+100*(i-1));
end

x=50:50:500;
figure(1);hold on;

plot(x,accMax1,'-s','color','r','LineWidth',1.5);
plot(x,accMax2,'--p','color','b');
plot(x,accMax3,'--o','color','k');

[L,icons] = legend('MPSDA','SDA(Centralized)','SDA(Distributed)','Location','NorthEastOutside');
set(L,'fontsize',20);
for k = 1:3
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
xlabel('Traning Set Size on Each Machine');
ylabel('Accuracy');