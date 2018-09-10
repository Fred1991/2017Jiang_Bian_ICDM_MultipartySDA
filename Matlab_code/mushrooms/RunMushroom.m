nTrain = 7;
nRun = 5;
LeaderSize = 5;
f1Max1 = zeros(nRun,nTrain);
accMax1 = zeros(nRun,nTrain);
AUC1 = zeros(nRun,nTrain);
f1Max2 = zeros(nRun,nTrain);
accMax2 = zeros(nRun,nTrain);
AUC2 = zeros(nRun,nTrain);
f1Max3 = zeros(nRun,nTrain);
accMax3 = zeros(nRun,nTrain);
AUC3 = zeros(nRun,nTrain);

f1Max4 = zeros(nRun,nTrain);
accMax4 = zeros(nRun,nTrain);
AUC4 = zeros(nRun,nTrain);
for i=1:nRun
    %for j=1:nTrain
    for j=1:nTrain
     [~, ~, ~, ~, f1Max1(i,j), accMax1(i,j), AUC1(i,j)] = Testbenchmark2(11,1,50+50*(j-1),LeaderSize);
     [~, ~, ~, ~, f1Max2(i,j), accMax2(i,j), AUC2(i,j)] = benchmarkDS(1,50+50*(j-1));
     [~, ~, ~, ~, f1Max3(i,j), accMax3(i,j), AUC3(i,j)] = benchmarkDis(1,50+50*(j-1));
     [~, ~, ~, ~, f1Max4(i,j), accMax4(i,j), AUC4(i,j)] = Testbenchmark2(11,1,50+50*(j-1),LeaderSize+5);
%     f1 = @Testbenchmark2;
%     t1 = timeit(f1);
    %f2 = @benchmarkDS;
    %t2 = timeit(f2);
    %f3 = @benchmarkDis;
    %t3 = timeit(f3);
    end
end

acc1 = mean(accMax1);
acc2 = mean(accMax2);
acc3 = mean(accMax3);

baracc1 = std(accMax1);
baracc2 = std(accMax2);
baracc3 = std(accMax3);
barf11 = std(f1Max1);
barf12 = std(f1Max2);
barf13 = std(f1Max3);

x=10:10:70;
figure(1);hold on;
% mseb(x,acc1,baracc1);
% mseb(x,acc2,baracc2);
% mseb(x,acc3,baracc3);
plot(x,acc1,'-s','color','r','LineWidth',1.5);
plot(x,acc2,'--p','color','b');
plot(x,acc3,'--o','color','k');

[L,icons] = legend('MP2SDA','Centralized SDA','Distributed SDA','Location','best');
set(L,'fontsize',20);
for k = 1:3
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
%ylim([0.75 1]);
xlabel('Traning Data per Machine (# Mach. = 10)');
ylabel('Accuracy');

figure(2);hold on;
f1 = mean(f1Max1);
f2 = mean(f1Max2);
f3 = mean(f1Max3);

plot(x,f1,'-s','color','r','LineWidth',1.5);
plot(x,f2,'--p','color','b');
plot(x,f3,'--o','color','k');

[L,icons] = legend('MP2SDA','Centralized SDA','Distributed SDA','Location','best');
set(L,'fontsize',20);
for k = 1:3
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
xlabel('Traning Data per Machine (# Mach. = 10)');
ylabel('F1-Score');

% acc1 = mean(accMax1,2);
% acc2 = mean(accMax2,2);
% acc3 = mean(accMax3,2);
% 
% x=50:50:500;
% figure(1);hold on;
% 
% plot(x,acc1,'-s','color','r','LineWidth',1.5);
% plot(x,acc2,'--p','color','b');
% plot(x,acc3,'--o','color','k');
% 
% [L,icons] = legend('MPSDA','SDA(Centralized)','SDA(Distributed)','Location','best');
% set(L,'fontsize',20);
% for k = 1:3
% icons(k).FontSize = 16;
% end
% set(gca,'FontSize',20);
% %set(gca,'xticklabel',{'0','100','200','300'});
% %xlim([15 150]);
% ylim([0.75 1]);
% xlabel('Traning Data per Machine ( Total=4 )');
% ylabel('Accuracy');
% 
% figure(2);hold on;
% f1 = mean(f1Max1,2);
% f2 = mean(f1Max2,2);
% f3 = mean(f1Max3,2);
% 
% plot(x,f1,'-s','color','r','LineWidth',1.5);
% plot(x,f2,'--p','color','b');
% plot(x,f3,'--o','color','k');
% 
% [L,icons] = legend('MPSDA','SDA(Centralized)','SDA(Distributed)','Location','best');
% set(L,'fontsize',20);
% for k = 1:3
% icons(k).FontSize = 16;
% end
% set(gca,'FontSize',20);
% %set(gca,'xticklabel',{'0','100','200','300'});
% %xlim([15 150]);
% xlabel('Traning Data per Machine ( Total=4 )');
% ylabel('F1-Score');