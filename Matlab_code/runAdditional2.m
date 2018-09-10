
% numTrainDat = 200;
% rep = 40;
% numSample = 10;
% %initial
% temp1Sum = zeros(numSample,1);
% temp2Sum = zeros(numSample,1);
% temp3Sum = zeros(numSample,1);
% acc1Sum = zeros(numSample,1);
% acc2Sum = zeros(numSample,1);
% acc3Sum = zeros(numSample,1);
% acc4Sum = zeros(numSample,1);
% repRemove = zeros(numSample,1);
% for k=1:rep
%     numTrainDat = 200;
%     [ttrain,ftrain,ttest,ftest,numTestDat,mftrain,mttrain,lambdaGlasso,cov] = additionalTest2(numTrainDat);
%     for i=1:numSample
%         numTrainDat = 200;
%         [rttrain,rftrain,numTrainDat] = ReducedSample(ttrain,ftrain,numTrainDat,20*(i-1));
%         [d1,d2,d3,Accmax3,Accmax2,Accmax1,Accmax4]=Results(rttrain,rftrain,ttest,ftest,numTrainDat,numTestDat,mftrain,mttrain,lambdaGlasso,cov);
%         temp1(i) = d1;
%         temp2(i) = d2;
%         temp3(i) = d3;
%         acc1(i) = Accmax1;
%         acc2(i) = Accmax2;
%         acc3(i) = Accmax3;
%         acc4(i) = Accmax4;
%     end
%     for j=1:numSample
%         temp1Sum(j) = temp1Sum(j)+temp1(j);
%         temp2Sum(j) = temp2Sum(j)+temp2(j);
%         temp3Sum(j) = temp3Sum(j)+temp3(j);
%         acc1Sum(j) = acc1Sum(j)+acc1(j);
%         acc2Sum(j) = acc2Sum(j)+acc2(j);
%         acc3Sum(j) = acc3Sum(j)+acc3(j);
%         acc4Sum(j) = acc4Sum(j)+acc4(j);
%     end
% end
% temp1Mean = temp1Sum / rep;
% temp2Mean = temp2Sum / rep;
% temp3Mean = temp3Sum / rep;
% acc1Mean = acc1Sum / rep;
% acc2Mean = acc2Sum / rep;
% acc3Mean = acc3Sum / rep;
% acc4Mean = acc4Sum / rep;

%remove

% figure(1);hold on;
% %x=[20000 10000 5000 2500];
% x=[40:40:400];
% 
% plot(x,flipud(temp1Mean),'-o','color','b');
% plot(x,flipud(temp2Mean),'-x','color','k');
% plot(x,flipud(temp3Mean),'-s','color','r','LineWidth',1.5);
% 
% L = legend('$|\widehat\beta^{G} -\beta^{*}|_{\infty}$','$|\bar\beta -\beta^{*}|_{\infty}$','$|\widehat\beta^{D} -\beta^{*}|_{\infty}$','Location','best');
% set(L,'Interpreter','latex');
% %[L,icons] = legend({'SDA','LDA','DBSDA'},'Location','best');
% set(L,'fontsize',20);
% %ylim([5.5 7]);
% %  for k = 1:3
% %     icons(k).FontSize = 16;
% %  end
% set(gca,'FontSize',20);
% ylim([5.9 8.2]);
% %xlim([2500 20000]);
% xlabel('Traning Set Size');
% ylabel('');

%yyplot
% x = [40:40:400];
% y1 = flipud(temp2Mean);
% y2 = flipud(temp1Mean);
% y3 = flipud(temp3Mean);
% 
% figure
% [hAx,hLine1,hLine2] = plotyy(x,y1',[x',x'],[y2,y3]);
% L = legend('$|\bar\beta -\beta^{*}|_{\infty}$','$|\widehat\beta^{G} -\beta^{*}|_{\infty}$','$|\widehat\beta^{D} -\beta^{*}|_{\infty}$','Location','best');
% set(L,'Interpreter','latex');
% set(L,'fontsize',20);
% hLine1.LineWidth=1.5;
% hLine2.LineWidth=2.0;
% xlabel('Training Set Size');
% ylabel(hAx(1),'Error of LDA'); % left y-axis 
% ylabel(hAx(2),'Error of SDA and DBSDA'); % right y-axis

%yyaxis
fig=figure;
left_color = [1 0 0];
right_color = [0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
x = [40:40:400];
y1 = flipud(temp1Mean);
y3 = flipud(temp3Mean);
yyaxis left
plot(x,y1,'-o');
hold on
plot(x,y3,'-p','LineWidth',2.5);

xlabel('Traning Set Size');
ylabel('$\ell_{\infty}$ Error of SDA($\widehat\beta^{G}$) and DBSDA($\widehat\beta^{D}$)','Interpreter','latex');

y2 = flipud(temp2Mean);
yyaxis right
plot(x,y2,'-x');
ylabel('$\ell_{\infty}$ Error of LDA($\bar\beta$)','Interpreter','latex');
L = legend('$|\widehat\beta^{G} -\beta^{*}|_{\infty}$','$|\widehat\beta^{D} -\beta^{*}|_{\infty}$','$|\bar\beta -\beta^{*}|_{\infty}$','Location','best');
set(L,'Interpreter','latex');
set(L,'fontsize',20);
set(gca,'FontSize',20);
hold off