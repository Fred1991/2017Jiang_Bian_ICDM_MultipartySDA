%display(100);
iNum=15;
runNum=20;
x=zeros(iNum,1);
for i=1:iNum
    for j=1:1
        temp1 = zeros(10,1);
        temp2 = zeros(10,1);
        temp3 = zeros(10,1);
        acc1 = zeros(10,1);
        acc2 = zeros(10,1);
        acc3 = zeros(10,1);
        acc4 = zeros(10,1);
        for k=1:runNum
            [d1,d2,d3,Accmax3,Accmax2,Accmax1,Accmax4]=additionalTest(1, 2^i);
            temp1(k) = d1;
            temp2(k) = d2;
            temp3(k) = d3;
            acc1(k) = Accmax1;
            acc2(k) = Accmax2;
            acc3(k) = Accmax3;
            acc4(k) = Accmax4;
        end
        temp1Mean = sum(temp1) / runNum;
        temp2Mean = sum(temp2) / runNum;
        temp3Mean = sum(temp3) / runNum;
        E1(i,j) = std(temp1);
        E2(i,j) = std(temp2);
        E3(i,j) = std(temp3);
        D1(i,j) = temp1Mean;
        D2(i,j) = temp2Mean;
        D3(i,j) = temp3Mean;
        D1acc(i,j) = sum(acc1) / runNum;
        D2acc(i,j) = sum(acc2) / runNum;
        D3acc(i,j) = sum(acc3) / runNum;
        D4acc(i,j) = sum(acc4) / runNum;
    end
    x(i) = 2^i;
end
% D1acc(10)=[];
% D2acc(10)=[];
% D3acc(10)=[];
% x=[20,30,40,50,60,70,80,90,100];
figure;hold on;
plot(x,D1,'-s','color','b');
plot(x,D2,'-s','color','k');
plot(x,D3,'-s','color','r','LineWidth',1.5);
%semilogy(x,D4acc,'-p','color','b','LineWidth',1.5);

%L = legend('$|\widehat\beta^{G} -\beta^{*}|_{\infty}$','$|\bar\beta -\beta^{*}|_{\infty}$','$|\widehat\beta^{D} -\beta^{*}|_{\infty}$','Location','best');
%set(L,'Interpreter','latex');
[L,icons] = legend({'SDA','LDA','DBSDA'},'Location','best');
set(L,'fontsize',20);
%ylim([5.5 7]);
 for k = 1:3
    icons(k).FontSize = 16;
 end
set(gca,'FontSize',20);
xlabel('Traning Set Size X2');
ylabel('Accuracy');
