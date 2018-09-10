x = [50, 100, 150, 200];

test_1 = [2.507, 4.953, 7.437, 9.896];
test_10 = [2.542, 5.187, 7.800, 10.173];
test_100 = [2.509, 4.995, 7.649, 10.000];
testw_1 = [13.185, 27.830, 43.865, 57.540];
testw_10 = [13.208, 27.773, 42.821, 57.623];
testw_100 = [13.198, 27.291, 42.660, 57.472];

figure(1);hold on;
plot(x,test_1,'-o','color','r');
plot(x,test_10,'-o','color','b');
plot(x,test_100,'-o','color','k');
plot(x,testw_1,'--s','color','r');
plot(x,testw_10,'--s','color','b');
plot(x,testw_100,'--s','color','k');

[L,icons] = legend('AWDA(\lambda=1.0, Adult-1)','AWDA(\lambda=10.0, Adult-1)','AWDA(\lambda=100.0, Adult-1)','AWDA(\lambda=1.0, Web-1)','AWDA(\lambda=10.0, Web-1)','AWDA(\lambda=100.0, Web-1)','Location','best');
set(L,'fontsize',20);
for k = 1:6
icons(k).FontSize = 18;
end
set(gca,'FontSize',20);
xlabel('Number of Sampled Inversed Covariance Matrix (m)');
ylabel('Time Consumption (ms)');



train_1 = [27038.55*0.25, 27038.55*0.5, 27038.55*0.75, 27038.55];
train_10 = [26985.5*0.25, 26985.5*0.5, 26985.5*0.75, 26985.5];
train_100 = [27112.55*0.25, 27112.55*0.5, 27112.55*0.75, 27112.55];
trainw_1 = [273705.4*0.25, 273705.4*0.5, 273705.4*0.75, 273705.4];
trainw_10 = [273926.7*0.25, 273926.7*0.5, 273926.7*0.75, 273926.7];
trainw_100 = [273894.9*0.25, 273894.9*0.5, 273894.9*0.75, 273894.9];


figure(2);hold on;
plot(x,train_1,'-o','color','r');
plot(x,train_10,'-o','color','b');
plot(x,train_100,'-o','color','k');
plot(x,trainw_1,'--s','color','r');
plot(x,trainw_10,'--s','color','b');
plot(x,trainw_100,'--s','color','k');


[L,icons] = legend('AWDA(\lambda=1.0, Adult-1)','AWDA(\lambda=10.0, Adult-1)','AWDA(\lambda=100.0, Adult-1)','AWDA(\lambda=1.0, Web-1)','AWDA(\lambda=10.0, Web-1)','AWDA(\lambda=100.0, Web-1)','Location','best');
set(L,'fontsize',20);
for k = 1:6
icons(k).FontSize = 18;
end
set(gca,'FontSize',20);
xlabel('Number of Sampled Inversed Covariance Matrix (m)');
ylabel('Time Consumption (ms)');



