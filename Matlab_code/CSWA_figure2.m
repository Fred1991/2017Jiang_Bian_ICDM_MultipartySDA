T = readtable('tempOutput3_com.txt');
rows_cm = (T.Var4 == 30 & T.Var6 == 1);
vars_cn = {'Var1','Var2','Var3','Var7'};
T3 = T(rows_cm,vars_cn);

% latent 2
rows_la2 = (T3.Var2 == 2);
vars_la2 = {'Var1','Var2','Var3','Var7'};
Tla2 = T3(rows_la2,vars_la2);
% latent 4
rows_la4 = (T3.Var2 == 4);
vars_la4 = {'Var1','Var2','Var3','Var7'};
Tla4 = T3(rows_la4,vars_la4);
% latent 6
rows_la6 = (T3.Var2 == 6);
vars_la6 = {'Var1','Var2','Var3','Var7'};
Tla6 = T3(rows_la6,vars_la6);
% latent 8
rows_la8 = (T3.Var2 == 8);
vars_la8 = {'Var1','Var2','Var3','Var7'};
Tla8 = T3(rows_la8,vars_la8);
% latent 10
rows_la10 = (T3.Var2 == 10);
vars_la10 = {'Var1','Var2','Var3','Var7'};
Tla10 = T3(rows_la10,vars_la10);


% wind 20
rows_w20 = (T3.Var3 == 20);
vars_w20 = {'Var1','Var2','Var3','Var7'};
Tw20 = T3(rows_w20,vars_w20);
% wind 30
rows_w30 = (T3.Var3 == 30);
vars_w30 = {'Var1','Var2','Var3','Var7'};
Tw30 = T3(rows_w30,vars_w30);
% wind 40
rows_w40 = (T3.Var3 == 40);
vars_w40 = {'Var1','Var2','Var3','Var7'};
Tw40 = T3(rows_w40,vars_w40);
% wind 50
rows_w50 = (T3.Var3 == 50);
vars_w50 = {'Var1','Var2','Var3','Var7'};
Tw50 = T3(rows_w50,vars_w50);


slices = cellfun(@(value) Tla2(strcmp(Tla2.Var1,value),:), unique(Tla2.Var1),'UniformOutput',false);
figure(1);hold on;
x = 20:10:50;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var7','-d','color','k');
%plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Size of Window');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tla2(strcmp(Tla2.Var1,value),:), unique(Tla2.Var1),'UniformOutput',false);
figure(11);hold on;
x = 20:10:50;
plot(x,slices{1}.Var7','--o','color','b');
plot(x,slices{2}.Var7','-s','color','r');
plot(x,slices{3}.Var7','--d','color','k');
plot(x,slices{4}.Var7','--^','color','k');
[L,icons] = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:4
 icons(k).FontSize = 20;
end
xlabel('The Size of Window');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tla4(strcmp(Tla4.Var1,value),:), unique(Tla4.Var1),'UniformOutput',false);
figure(2);hold on;
x = 20:10:50;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var7','-d','color','k');
%plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Size of Window');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tla6(strcmp(Tla6.Var1,value),:), unique(Tla6.Var1),'UniformOutput',false);
figure(3);hold on;
x = 20:10:50;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var7','-d','color','k');
%plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Size of Window');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tla8(strcmp(Tla8.Var1,value),:), unique(Tla8.Var1),'UniformOutput',false);
figure(4);hold on;
x = 20:10:50;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var7','-d','color','k');
%plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Size of Window');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tla10(strcmp(Tla10.Var1,value),:), unique(Tla10.Var1),'UniformOutput',false);
figure(5);hold on;
x = 20:10:50;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var7','-d','color','k');
%plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Size of Window');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);



slices = cellfun(@(value) Tw20(strcmp(Tw20.Var1,value),:), unique(Tw20.Var1),'UniformOutput',false);
figure(12);hold on;
x = 2:2:10;
plot(x,slices{1}.Var7','--o','color','b');
plot(x,slices{2}.Var7','-s','color','r');
plot(x,slices{3}.Var7','--d','color','k');
plot(x,slices{4}.Var7','--^','color','k');
[L,icons] = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:4
 icons(k).FontSize = 20;
end
xlabel('The Size of Latent Space');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tw20(strcmp(Tw20.Var1,value),:), unique(Tw20.Var1),'UniformOutput',false);
figure(6);hold on;
x = 2:2:10;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var7','-d','color','k');
%plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Size of Latent Space');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tw30(strcmp(Tw30.Var1,value),:), unique(Tw30.Var1),'UniformOutput',false);
figure(7);hold on;
x = 2:2:10;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var7','-d','color','k');
%plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Size of Latent Space');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tw40(strcmp(Tw40.Var1,value),:), unique(Tw40.Var1),'UniformOutput',false);
figure(8);hold on;
x = 2:2:10;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var7','-d','color','k');
%plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Size of Latent Space');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tw50(strcmp(Tw50.Var1,value),:), unique(Tw50.Var1),'UniformOutput',false);
figure(9);hold on;
x = 2:2:10;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
%plot(x,slices{3}.Var7','-d','color','k');
%plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Size of Latent Space');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

% slices = cellfun(@(value) Tl5(strcmp(Tl5.Var1,value),:), unique(Tl5.Var1),'UniformOutput',false);
% figure(10);hold on;
% x = 10:5:30;
% plot(x,slices{1}.Var7','-o','color','k');
% plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
% % plot(x,slices{3}.Var7','-d','color','k');
% % plot(x,slices{4}.Var7','-^','color','k');
% [L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
% %L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
% set(L,'fontsize',20);
% set(gca,'FontSize',20);
% for k = 1:2
%  icons(k).FontSize = 16;
% end
% xlabel('The Number of Participants');
% ylabel('Absolute Error (Degree Cent.)');
% %ylim([0 1]);