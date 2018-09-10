num = 4;
sampleE1 = zeros(num,1);
sampleE2 = zeros(num,1);
sampleEInf = zeros(num,1);
gE1 = zeros(num,1);
gE2 = zeros(num,1);
gEInf = zeros(num,1);
deE1 = zeros(num,1);
deE2 = zeros(num,1);
deEInf = zeros(num,1);
for i=1:num
    [deEInf(i),deE1(i),deE2(i),gEInf(i),gE1(i),gE2(i),sampleEInf(i),sampleE1(i),sampleE2(i)] = newErrorTest2(i*100);
end

x = 200:200:800;
figure(1);hold on;
plot(x,sampleE1,'--o','color','b');
plot(x,gE1,'--o','color','r');
plot(x,deE1,'--o','color','k');
ylim([5 165]);
xlim([400 800]);
L = legend('$|\widehat\Theta -\Theta^{*}|_{1}$','$|\widehat\Theta^{G} -\Theta^{*}|_{1}$','$|\widehat\Theta^{D} -\Theta^{*}|_{1}$','Location','best');
set(L,'Interpreter','latex');
set(gca,'FontSize',20);
xlabel('Number of Samples');
ylabel('Estimation Error');

figure(2);hold on;
plot(x,sampleE2,'--o','color','b');
plot(x,gE2,'--o','color','r');
plot(x,deE2,'--o','color','k');
ylim([5 165]);
xlim([400 800]);
L = legend('$|\widehat\Theta -\Theta^{*}|_{2}$','$|\widehat\Theta^{G} -\Theta^{*}|_{2}$','$|\widehat\Theta^{D} -\Theta^{*}|_{2}$','Location','best');
set(L,'Interpreter','latex');
set(gca,'FontSize',20);
xlabel('Number of Samples');
ylabel('Estimation Error');

figure(3);hold on;
plot(x,sampleEInf,'--o','color','b');
plot(x,gEInf,'--o','color','r');
plot(x,deEInf,'--o','color','k');
ylim([5 165]);
xlim([400 800]);
L = legend('$|\widehat\Theta -\Theta^{*}|_{\infty}$','$|\widehat\Theta^{G} -\Theta^{*}|_{\infty}$','$|\widehat\Theta^{D} -\Theta^{*}|_{\infty}$','Location','best');
set(L,'Interpreter','latex');
set(gca,'FontSize',20);
xlabel('Number of Samples');
ylabel('Estimation Error');