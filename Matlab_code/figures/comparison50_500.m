y=[0.601 0.626 0.628 0.641 0.663 0.650;
   0.601 0.627 0.628 0.640 0.664 0.649;
   0.601 0.627 0.628 0.641 0.664 0.649;
   0.601 0.627 0.628 0.641 0.664 0.649];
x = 0.5:1:3.5;
figure(1);hold on;
b = bar(x,y,1);
% b(2).LineWidth = 2;
%set(b,'barwidth',0.2);
ylim([0.550,0.680]);
grid on;
%ch = get(b,'children');
set(gca,'TickLabelInterpreter','latex');
set(gca,'XTickLabel',{'50','100','150','200'});
% Simultaneous change both Y and X
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
set(gca,'XTick',0.5:1:3.5);
ax = ancestor(b(1), 'axes');
xrule = ax.XAxis;
xrule.FontSize = 13;
%set(ch,'Fa ceVertexCData',[1 2 3 4;0 0 0;])
lgd = legend('RWDA(0.001)','RWDA(0.01)','RWDA(0.1)','RWDA(1.0)','RWDA(10.0)','BayesLDA','Location','NorthEastOutside');
title(lgd, 'Estimators')
xlabel('Parameter Setting (50x2 Training Samples)');
ylabel('Accuracy');

y=[0.668 0.690 0.688 0.699 0.693 0.676;
   0.668 0.691 0.688 0.699 0.694 0.676;
   0.669 0.692 0.688 0.699 0.694 0.676;
   0.669 0.691 0.687 0.699 0.694 0.676];
x = 0.5:1:3.5;
figure(2);hold on;
b = bar(x,y,1);
% b(2).LineWidth = 2;
%set(b,'barwidth',0.2);
ylim([0.650,0.710]);
grid on;
%ch = get(b,'children');
set(gca,'TickLabelInterpreter','latex');
set(gca,'XTickLabel',{'50','100','150','200'});
% Simultaneous change both Y and X
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
set(gca,'XTick',0.5:1:3.5);
ax = ancestor(b(1), 'axes');
xrule = ax.XAxis;
xrule.FontSize = 13;
%set(ch,'Fa ceVertexCData',[1 2 3 4;0 0 0;])
lgd = legend('RWDA(0.001)','RWDA(0.01)','RWDA(0.1)','RWDA(1.0)','RWDA(10.0)','BayesLDA','Location','NorthEastOutside');
title(lgd, 'Estimators')
xlabel('Parameter Setting (500x2 Training Samples)');
ylabel('Accuracy');

y=[0.607 0.645 0.648 0.679 0.705 0.699;
   0.608 0.646 0.648 0.678 0.706 0.698;
   0.607 0.645 0.648 0.679 0.706 0.698;
   0.607 0.645 0.648 0.679 0.706 0.698];
x = 0.5:1:3.5;
figure(3);hold on;
b = bar(x,y,1);
% b(2).LineWidth = 2;
%set(b,'barwidth',0.2);
ylim([0.600,0.715]);
grid on;
%ch = get(b,'children');
set(gca,'TickLabelInterpreter','latex');
set(gca,'XTickLabel',{'50','100','150','200'});
% Simultaneous change both Y and X
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
set(gca,'XTick',0.5:1:3.5);
ax = ancestor(b(1), 'axes');
xrule = ax.XAxis;
xrule.FontSize = 13;
%set(ch,'Fa ceVertexCData',[1 2 3 4;0 0 0;])
lgd = legend('RWDA(0.001)','RWDA(0.01)','RWDA(0.1)','RWDA(1.0)','RWDA(10.0)','BayesLDA','Location','NorthEastOutside');
title(lgd, 'Estimators')
xlabel('Parameter Setting (50x2 Training Samples)');
ylabel('F1-Score');

y=[0.689 0.724 0.718 0.732 0.736 0.725;
   0.689 0.725 0.717 0.732 0.736 0.726;
   0.689 0.726 0.718 0.732 0.736 0.725;
   0.690 0.726 0.717 0.732 0.736 0.726];
x = 0.5:1:3.5;
figure(4);hold on;
b = bar(x,y,1);
% b(2).LineWidth = 2;
%set(b,'barwidth',0.2);
ylim([0.680,0.740]);
grid on;
%ch = get(b,'children');
set(gca,'TickLabelInterpreter','latex');
set(gca,'XTickLabel',{'50','100','150','200'});
% Simultaneous change both Y and X
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
set(gca,'XTick',0.5:1:3.5);
ax = ancestor(b(1), 'axes');
xrule = ax.XAxis;
xrule.FontSize = 13;
%set(ch,'Fa ceVertexCData',[1 2 3 4;0 0 0;])
lgd = legend('RWDA(0.001)','RWDA(0.01)','RWDA(0.1)','RWDA(1.0)','RWDA(10.0)','BayesLDA','Location','NorthEastOutside');
title(lgd, 'Estimators')
xlabel('Parameter Setting (500x2 Training Samples)');
ylabel('F1-Score');