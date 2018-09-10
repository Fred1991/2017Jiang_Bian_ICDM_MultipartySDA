T = readtable('Results.txt');
slices = cellfun(@(value) T(strcmp(T.Var1,value),:), unique(T.Var1),'UniformOutput',false);
x = [50, 100, 150, 200, 250, 300, 350, 400, 450, 500];
%y = slices{1}.Var2';

% Plot
% for j=1:4
%     figure(j);hold on;
%     for i=(j-1)*15+1:(j-1)*15+15 
%         y = slices{i}.Var2';
%         plot(x,y);
%     end
% end

%Plot
figure;hold on;
for i=1:60 
  y = slices{i}.Var2';
  name = slices{i}.Var1(1); 
  plot(x,y,'DisplayName',sprintf('%s',name{1}));
  legend('-DynamicLegend');
end
