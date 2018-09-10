T = readtable('tempOutput3_com.txt');
rows = (T.Var2 == 2 & T.Var3 == 20);
vars = {'Var1','Var4','Var6','Var7'};

T2 = T(rows,vars);
% Crowd 10
rows_c10 = (T2.Var4 == 10);
vars_c10 = {'Var1','Var4','Var6','Var7'};
Tc10 = T2(rows_c10,vars_c10);
% Crowd 15
rows_c15 = (T2.Var4 == 15);
vars_c15 = {'Var1','Var4','Var6','Var7'};
Tc15 = T2(rows_c15,vars_c15);
% Crowd 20
rows_c20 = (T2.Var4 == 20);
vars_c20 = {'Var1','Var4','Var6','Var7'};
Tc20 = T2(rows_c20,vars_c20);
% Crowd 25
rows_c25 = (T2.Var4 == 25);
vars_c25 = {'Var1','Var4','Var6','Var7'};
Tc25 = T2(rows_c25,vars_c25);
% Crowd 30
rows_c30 = (T2.Var4 == 30);
vars_c30 = {'Var1','Var4','Var6','Var7'};
Tc30 = T2(rows_c30,vars_c30);


% Location 1
rows_l1 = (T2.Var6 == 1);
vars_l1 = {'Var1','Var4','Var6','Var7'};
Tl1 = T2(rows_l1,vars_l1);
% Location 2
rows_l2 = (T2.Var6 == 2);
vars_l2 = {'Var1','Var4','Var6','Var7'};
Tl2 = T2(rows_l2,vars_l2);
% Location 3
rows_l3 = (T2.Var6 == 3);
vars_l3 = {'Var1','Var4','Var6','Var7'};
Tl3 = T2(rows_l3,vars_l3);
% Location 4
rows_l4 = (T2.Var6 == 4);
vars_l4 = {'Var1','Var4','Var6','Var7'};
Tl4 = T2(rows_l4,vars_l4);
% Location 5
rows_l5 = (T2.Var6 == 5);
vars_l5 = {'Var1','Var4','Var6','Var7'};
Tl5 = T2(rows_l5,vars_l5);

slices = cellfun(@(value) Tc10(strcmp(Tc10.Var1,value),:), unique(Tc10.Var1),'UniformOutput',false);
figure(1);hold on;
x = 1:1:5;
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
xlabel('The Maximum Number of Location');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tc10(strcmp(Tc10.Var1,value),:), unique(Tc10.Var1),'UniformOutput',false);
figure(11);hold on;
x = 1:1:5;
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
xlabel('The Maximum Number of Location');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tc15(strcmp(Tc15.Var1,value),:), unique(Tc15.Var1),'UniformOutput',false);
figure(2);hold on;
x = 1:1:5;
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
xlabel('The Maximum Number of Location');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tc20(strcmp(Tc20.Var1,value),:), unique(Tc20.Var1),'UniformOutput',false);
figure(3);hold on;
x = 1:1:5;
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
xlabel('The Maximum Number of Location');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

% slices = cellfun(@(value) Tc25(strcmp(Tc25.Var1,value),:), unique(Tc25.Var1),'UniformOutput',false);
% figure(4);hold on;
% x = 1:1:5;
% plot(x,slices{1}.Var7','-o','color','k');
% plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
% %plot(x,slices{3}.Var7','-d','color','k');
% %plot(x,slices{4}.Var7','-^','color','k');
% [L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
% %L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
% set(L,'fontsize',20);
% set(gca,'FontSize',20);
% for k = 1:2
%  icons(k).FontSize = 15;
% end
% xlabel('The Maximum Number of Location');
% ylabel('Absolute Error (Degree Cent.)');
% %ylim([0 1]);

% slices = cellfun(@(value) Tc30(strcmp(Tc30.Var1,value),:), unique(Tc30.Var1),'UniformOutput',false);
% figure(5);hold on;
% x = 1:1:5;
% plot(x,slices{1}.Var7','-o','color','k');
% plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
% %plot(x,slices{3}.Var7','-d','color','k');
% %plot(x,slices{4}.Var7','-^','color','k');
% [L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
% %L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
% set(L,'fontsize',20);
% set(gca,'FontSize',20);
% for k = 1:2
%  icons(k).FontSize = 15;
% end
% xlabel('The Maximum Number of Location');
% ylabel('Absolute Error (Degree Cent.)');
% %ylim([0 1]);



slices = cellfun(@(value) Tl1(strcmp(Tl1.Var1,value),:), unique(Tl1.Var1),'UniformOutput',false);
figure(12);hold on;
x = 10:5:30;
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
xlabel('The Number of Participants');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tl1(strcmp(Tl1.Var1,value),:), unique(Tl1.Var1),'UniformOutput',false);
figure(6);hold on;
x = 10:5:30;
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
xlabel('The Number of Participants');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tl2(strcmp(Tl2.Var1,value),:), unique(Tl2.Var1),'UniformOutput',false);
figure(7);hold on;
x = 10:5:30;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
% plot(x,slices{3}.Var7','-d','color','k');
% plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Number of Participants');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

slices = cellfun(@(value) Tl3(strcmp(Tl3.Var1,value),:), unique(Tl3.Var1),'UniformOutput',false);
figure(8);hold on;
x = 10:5:30;
plot(x,slices{1}.Var7','--o','color','k');
plot(x,slices{2}.Var7','-s','color','r','LineWidth',1.5);
% plot(x,slices{3}.Var7','-d','color','k');
% plot(x,slices{4}.Var7','-^','color','k');
[L,icons] = legend('STCS','CSWA','Location','NorthEastOutside');
%L = legend('STCS','CSWA','RPCA','TSVD','Location','NorthEastOutside');
set(L,'fontsize',22);
set(gca,'FontSize',22);
for k = 1:2
 icons(k).FontSize = 20;
end
xlabel('The Number of Participants');
ylabel('Absolute Error (Degree Cent.)');
legend boxoff;
%ylim([0 1]);

% slices = cellfun(@(value) Tl4(strcmp(Tl4.Var1,value),:), unique(Tl4.Var1),'UniformOutput',false);
% figure(9);hold on;
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
%  icons(k).FontSize = 15;
% end
% xlabel('The Number of Participants');
% ylabel('Absolute Error (Degree Cent.)');
% %ylim([0 1]);

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
%  icons(k).FontSize = 15;
% end
% xlabel('The Number of Participants');
% ylabel('Absolute Error (Degree Cent.)');
% %ylim([0 1]);




