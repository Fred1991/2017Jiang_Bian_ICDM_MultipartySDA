% multiAcc = mean(multiaccMax,2);
% multiAUC = mean(multiAUC,2);
% multiF1 = mean(multif1Max,2);
% disAcc = mean(disaccMax,2);
% disAUC = mean(disAUC,2);
% disF1 = mean(disf1Max,2);
% sparseAcc = mean(saccMax,2);
% sparseAUC = mean(sAUC,2);
% sparseF1 = mean(sf1Max,2);

multiAcc = multiaccMax(3,:);
multiAUC = multiAUC(3,:);
multiF1 = multif1Max(3,:);
disAcc = disaccMax(3,:);
disAUC = disAUC(3,:);
disF1 = disf1Max(3,:);
sparseAcc = saccMax(3,:);
sparseAUC = sAUC(3,:);
sparseF1 = sf1Max(3,:);


x=20:20:100;
figure(1);hold on;
plot(x,multiAcc,'-s','color','r','LineWidth',1.5);
plot(x,sparseAcc,'--p','color','b');
plot(x,disAcc,'--o','color','k');
[L,icons] = legend('MPSDA','Centralized SDA','Distributed SDA','Location','best');
set(L,'fontsize',20);
for k = 1:3
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
ylim([0.6 0.9]);
xlabel('Number of Machines');
ylabel('Accuracy');

figure(2);hold on;
plot(x,multiF1,'-s','color','r','LineWidth',1.5);
plot(x,sparseF1,'--p','color','b');
plot(x,disF1,'--o','color','k');
[L,icons] = legend('MPSDA','Centralized SDA','Distributed SDA','Location','best');
set(L,'fontsize',20);
for k = 1:3
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
ylim([0.6 0.9]);
xlabel('Number of Machines');
ylabel('F1-Score');

figure(3);hold on;
plot(x,multiAUC,'-s','color','r','LineWidth',1.5);
plot(x,sparseAUC,'--p','color','b');
plot(x,disAUC,'--o','color','k');
[L,icons] = legend('MPSDA','Centralized SDA','Distributed SDA','Location','best');
set(L,'fontsize',20);
for k = 1:3
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
ylim([0.6 1]);
xlabel('Number of Machines');
ylabel('Area Under the ROC (AUC)');

% figure(4);hold on;
% numTestDat = 200;
% [xsorted1, I1] = sort(cell2mat(multiFp(1,5))/numTestDat);
% [xsorted2, I2] = sort(cell2mat(dsFp(1,5))/numTestDat);
% [xsorted3, I3] = sort(cell2mat(disFp(1,5))/numTestDat);
% y1 = cell2mat(multiTp(1,5))/numTestDat;
% y2 = cell2mat(dsTp(1,5))/numTestDat;
% y3 = cell2mat(disTp(1,5))/numTestDat;
% ysorted1 = y1(I1);
% ysorted2 = y2(I2);
% ysorted3 = y3(I3);
% plot(xsorted1,ysorted1,'color','r','LineWidth',1.5);
% plot(xsorted2,ysorted2,'color','b');
% plot(xsorted3,ysorted3,'color','k');
% ref = refline(1);
% set(ref,'LineStyle','--')
% [L,icons] = legend('MPSDA','SDA(Centralized)','SDA(Distributed)','Location','best');
% set(L,'fontsize',20);
% for k = 1:3
% icons(k).FontSize = 16;
% end
% set(gca,'FontSize',20);
% %set(gca,'xticklabel',{'0','100','200','300'});
% %xlim([15 150]);
% %ylim([0.6 1]);
% xlabel('False Positive Rate');
% ylabel('True Positive Rate');

figure(4);hold on;
numTestDat = 200;
[xsorted1, I1] = sort(cell2mat(multiFp(3,5))/numTestDat);
[xsorted2, I2] = sort(cell2mat(dsFp(3,5))/numTestDat);
[xsorted3, I3] = sort(cell2mat(disFp(3,5))/numTestDat);
y1 = cell2mat(multiTp(3,5))/numTestDat;
y2 = cell2mat(dsTp(3,5))/numTestDat;
y3 = cell2mat(disTp(3,5))/numTestDat;
ysorted1 = y1(I1);
ysorted2 = y2(I2);
ysorted3 = y3(I3);
plot(xsorted1,ysorted1,'color','r','LineWidth',1.5);
plot(xsorted2,ysorted2,'color','b');
plot(xsorted3,ysorted3,'color','k');
ref = refline(1);
set(ref,'LineStyle','--')
[L,icons] = legend('MPSDA','Centralized SDA','Distributed SDA','Location','best');
set(L,'fontsize',20);
for k = 1:3
icons(k).FontSize = 16;
end
set(gca,'FontSize',20);
%set(gca,'xticklabel',{'0','100','200','300'});
%xlim([15 150]);
%ylim([0.6 1]);
xlabel('False Positive Rate');
ylabel('True Positive Rate');