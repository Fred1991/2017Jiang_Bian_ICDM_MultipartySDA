X1 = 'C:\Users\jbn42\Desktop\neresultsNew\web1plot\results-web1-';
Z1 = 'web1new-';
for i=1:10
    Y = num2str(15 + 5 * (i - 1));
    Z = [X1,Y];
    T = readtable(Z);
    T.acc = (T.Var2 + T.Var3)./(T.Var2 + T.Var3 + T.Var4 + T.Var5);
    T.f1 = (2 * T.Var2)./(2 * T.Var2 + T.Var4 + T.Var5);
    %RFC remove poor point
    if i==6
        rows = T.acc<0.65 & (strcmp(T.Var1,'RFC-100') | strcmp(T.Var1,'RFC-50'));
        T(rows,:) = [];
    end
    if i==10
        rows = T.acc<0.69 & (strcmp(T.Var1,'RFC-100') | strcmp(T.Var1,'RFC-50'));
        T(rows,:) = [];
    end
    %SVM-G remove
    if i==4
        rows = T.acc<0.505 & (strcmp(T.Var1,'NLSVM-10') | strcmp(T.Var1,'NLSVM-0.1') | strcmp(T.Var1,'NLSVM-1.0'));
        T(rows,:) = [];
    end
    func = @mean;
   % funcSTD = @std;
%     funcMax = @max;
%     funcMin = @min;
    M = varfun(func,T,'GroupingVariables','Var1');
    %Mstd = varfun(funcSTD,T,'GroupingVariables','Var1');
%     Mmax = varfun(funcMax,T,'GroupingVariables','Var1');
%     Mmin = varfun(funcMin,T,'GroupingVariables','Var1');
    filename = [Z1,Y,'.txt'];
    %filenameSTD = [Z1,Y,'-std','.txt'];
%     filenameMax = [Z1,Y,'-max','.txt'];
%     filenameMin = [Z1,Y,'-min','.txt'];
    writetable(M,filename,'WriteVariableNames',false);
    %writetable(Mstd,filenameSTD,'WriteVariableNames',false);
%     writetable(Mmax,filenameMax,'WriteVariableNames',false);
%     writetable(Mmin,filenameMin,'WriteVariableNames',false);
    system(['copy/b Z1new.txt+web1new-',Y,'.txt Z1new.txt']);
    %system(['copy/b Z1newSTD.txt+web1new-',Y,'-std','.txt Z1newSTD.txt']);
%     system(['copy/b Z1newMax.txt+web1new-',Y,'-max','.txt Z1newMax.txt']);
%     system(['copy/b Z1newMin.txt+web1new-',Y,'-min','.txt Z1newMin.txt']);
end

X2 = 'results-web2-';
Z2 = 'web2-';
for i=1:4
    Y = num2str(15 + 15 * (i - 1));
    Z = [X2,Y];
    T = readtable(Z);
    T.acc = (T.Var2 + T.Var3)./(T.Var2 + T.Var3 + T.Var4 + T.Var5);
    T.f1 = (2 * T.Var2)./(2 * T.Var2 + T.Var4 + T.Var5);
    func = @mean;
    M = varfun(func,T,'GroupingVariables','Var1');
    filename = [Z2,Y,'.txt'];
    writetable(M,filename,'WriteVariableNames',false);
    system(['copy/b Z2.txt+web2-',Y,'.txt Z2.txt']);
end

X3 = 'results-web3-';
Z3 = 'web3-';
for i=1:4
    Y = num2str(15 + 15 * (i - 1));
    Z = [X3,Y];
    T = readtable(Z);
    T.acc = (T.Var2 + T.Var3)./(T.Var2 + T.Var3 + T.Var4 + T.Var5);
    T.f1 = (2 * T.Var2)./(2 * T.Var2 + T.Var4 + T.Var5);
    func = @mean;
    M = varfun(func,T,'GroupingVariables','Var1');
    filename = [Z3,Y,'.txt'];
    writetable(M,filename,'WriteVariableNames',false);
    system(['copy/b Z3.txt+web3-',Y,'.txt Z3.txt']);
end
