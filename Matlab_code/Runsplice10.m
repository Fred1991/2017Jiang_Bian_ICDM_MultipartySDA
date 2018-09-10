nTrain = 10;
nRun = 10;
leaderSize = 3;
f1Max1 = zeros(nRun,nTrain);
accMax1 = zeros(nRun,nTrain);
AUC1 = zeros(nRun,nTrain);
f1Max2 = zeros(nRun,nTrain);
accMax2 = zeros(nRun,nTrain);
AUC2 = zeros(nRun,nTrain);
f1Max3 = zeros(nRun,nTrain);
accMax3 = zeros(nRun,nTrain);
AUC3 = zeros(nRun,nTrain);
for i=1:nRun
    for j=1:nTrain
    [~, ~, ~, ~, f1Max1(i,j), accMax1(i,j), AUC1(i,j)] = spliceMPSDs(3,0.4,100+100*(j-1),leaderSize);
    [~, ~, ~, ~, f1Max2(i,j), accMax2(i,j), AUC2(i,j)] = spliceDS(1,100+100*(j-1));
    [~, ~, ~, ~, f1Max3(i,j), accMax3(i,j), AUC3(i,j)] = spliceDis(0.3,100+100*(j-1));
    end
    
    disp([num2str(nRun),' run finished.']);
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

x=50:50:500;
figure(1);hold on;

plot(x,acc1,'-s','color','r','LineWidth',1.5);
plot(x,acc2,'--p','color','b');
plot(x,acc3,'--o','color','k');

[L,icons] = legend('MPSDA','Centralized SDA','Distributed SDA','Location','best');
set(L,'fontsize',20);
for k = 1:3
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
%ylim([0.75 1]);
xlabel('Traning Data per Machine (# Mach. = 4)');
ylabel('Accuracy');

figure(2);hold on;
f1 = mean(f1Max1);
f2 = mean(f1Max2);
f3 = mean(f1Max3);

plot(x,f1,'-s','color','r','LineWidth',1.5);
plot(x,f2,'--p','color','b');
plot(x,f3,'--o','color','k');

[L,icons] = legend('MPSDA','Centralized SDA','Distributed SDA','Location','best');
set(L,'fontsize',20);
for k = 1:3
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
xlabel('Traning Data per Machine (# Mach. = 4)');
ylabel('F1-Score');

% figure(3);hold on;
% auc1 = mean(AUC1);
% auc2 = mean(AUC2);
% auc3 = mean(AUC3);
% 
% plot(x,auc1,'-s','color','r','LineWidth',1.5);
% plot(x,auc2,'--p','color','b');
% plot(x,auc3,'--o','color','k');
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
% ylabel('AUC');