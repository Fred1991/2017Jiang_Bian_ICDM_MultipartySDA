X = 'accuracy-ehr-';
Z1 = 'ehr-';
for i=1:10
    Y = num2str(50 + 50 * (i - 1));
    Z = [X,Y,'-200-90'];
    T = readtable(Z);
    T.acc = (T.Var2 + T.Var3)./(T.Var2 + T.Var3 + T.Var4 + T.Var5);
    T.f1 = (2 * T.Var2)./(2 * T.Var2 + T.Var4 + T.Var5);
    func = @mean;
    funcSTD = @std;
    M = varfun(func,T,'GroupingVariables','Var1');
    Mstd = varfun(funcSTD,T,'GroupingVariables','Var1');
    filename = [Z1,Y,'.txt'];
    filenameSTD = [Z1,Y,'-std','.txt'];
    writetable(M,filename,'WriteVariableNames',false);
    writetable(Mstd,filenameSTD,'WriteVariableNames',false);
%     system(['copy/b ehr.txt+ehr-',Y,'.txt ehr.txt']);
%     system(['copy/b std.txt+ehr-',Y,'-std','.txt std.txt']);
end


% x = [50, 100, 150, 200, 250, 300, 350];
% a1 = [0.631, 0.630, 0.620, 0.622, 0.621, 0.617, 0.626];%adaboost
% a2 = [0.621, 0.649, 0.652, 0.655, 0.671, 0.665, 0.668];%dtree
% a3 = [0.543, 0.586, 0.616, 0.642, 0.642, 0.657, 0.658];%LDA
% a4 = [0.615, 0.628, 0.647, 0.666, 0.666, 0.670, 0.675];%lsvm
% a5 = [0.635, 0.669, 0.674, 0.678, 0.668, 0.688, 0.682];%gsvm
% a6 = [0.590, 0.602, 0.653, 0.602, 0.674, 0.666, 0.658];%rfc
% a7 = [0.658, 0.676, 0.682, 0.686, 0.683, 0.692, 0.695];%SDA
% a8 = [0.659, 0.677, 0.691, 0.692, 0.690, 0.696, 0.701];%DBSDA
% b1 = [0.650, 0.533, 0.498, 0.503, 0.500, 0.482, 0.503];
% b2 = [0.626, 0.671, 0.676, 0.703, 0.695, 0.676, 0.690];
% b3 = [0.540, 0.580, 0.611, 0.646, 0.644, 0.662, 0.663];
% b4 = [0.616, 0.627, 0.651, 0.675, 0.675, 0.680, 0.690];
% b5 = [0.701, 0.723, 0.702, 0.726, 0.681, 0.734, 0.715];
% b6 = [0.419, 0.509, 0.613, 0.509, 0.661, 0.640, 0.603];
% b7 = [0.696, 0.716, 0.719, 0.725, 0.722, 0.733, 0.734];
% b8 = [0.690, 0.708, 0.722, 0.729, 0.727, 0.736, 0.734];
% 
% 
% figure(1);hold on;
% plot(x,a3,'-s','color','b');
% plot(x,a7,'-d','color','b');
% plot(x,a8,'-d','color','r','LineWidth',1.5);
% 
% [L,icons] = legend('LDA','SDA','DBSDA','Location','best');
% set(L,'fontsize',20);
% for k = 1:3
% icons(k).FontSize = 16;
% end
% set(gca,'FontSize',20);
% xlabel('Traning Set Size X2');
% ylabel('Accuracy');
% 
% figure(2);hold on;
% plot(x,a1,'--h','color','k');
% plot(x,a2,'--x','color','k');
% %plot(x,a3,'-s','color','b');
% plot(x,a4,'--d','color','k');
% plot(x,a5,'--s','color','k');
% plot(x,a6,'--o','color','k');
% %plot(x,a7,'-d','color','b');
% plot(x,a8,'-d','color','r','LineWidth',1.5);
% 
% [L,icons] = legend('Adaboost','DTree','LSVM','GSVM','RFC','DBSDA','Location','NorthEastOutside');
% set(L,'fontsize',20);
% for k = 1:6
% icons(k).FontSize = 16;
% end
% set(gca,'FontSize',20);
% xlabel('Traning Set Size X2');
% ylabel('Accuracy');
% 
% 
% 
% 
% 
% figure(3);hold on;
% plot(x,b3,'-s','color','b');
% plot(x,b7,'-d','color','b');
% plot(x,b8,'-d','color','r','LineWidth',1.5);
% 
% [L,icons] = legend('LDA','SDA','DBSDA','Location','best');
% set(L,'fontsize',20);
% for k = 1:3
% icons(k).FontSize = 16;
% end
% set(gca,'FontSize',20);
% xlabel('Traning Set Size X2');
% ylabel('F1-Score');
% 
% figure(4);hold on;
% plot(x,b1,'--h','color','k');
% plot(x,b2,'--x','color','k');
% %plot(x,a3,'-s','color','b');
% plot(x,b4,'--d','color','k');
% plot(x,b5,'--s','color','k');
% plot(x,b6,'--o','color','k');
% %plot(x,a7,'-d','color','b');
% plot(x,b8,'-d','color','r','LineWidth',1.5);
% 
% [L,icons] = legend('Adaboost','DTree','LSVM','GSVM','RFC','DBSDA','Location','NorthEastOutside');
% set(L,'fontsize',20);
% for k = 1:6
% icons(k).FontSize = 16;
% end
% set(gca,'FontSize',20);
% xlabel('Traning Set Size X2');
% ylabel('F1-Score');


