p = 200;
%numTrainDat = 50;
%machNum = 1;
%lambda = 10;
%lambdaGlasso = 10;

mftrain = zeros(p,1);
mttrain = vertcat(ones(10,1)*1,zeros(p-10,1));
ell1error_star=norm(mftrain-mttrain,1);
ell2error_star=norm(mftrain-mttrain);

cov=zeros(p,p);
for i=1:p
    for j=1:p
        cov(i,j)=0.8^abs(i-j);        
    end
end

N=5;
runNum=20;
iNum=15;
error_ell1=zeros(N,1);
error_ell2=zeros(N,1);
error_ell2P=zeros(N,1);
error_ell2N=zeros(N,1);
error_ell2Psum=zeros(iNum,1);
error_ell2Nsum=zeros(iNum,1);
error_ell2sum=zeros(iNum,1);
X=zeros(N,1);
for k=1:runNum
    for i=1:iNum                        
        numTrainDat = 2^i;
        ttrain=mvnrnd(mttrain,cov,numTrainDat);
        ftrain=mvnrnd(mftrain,cov,numTrainDat);
        mup=mean(ttrain);
        mun=mean(ftrain);
        %ell1error_bar=norm(mup-mun,1);
        ell2error_bar=norm(mup-mun,2);
        %error_ell2P(i)=norm(mup-mttrain',2)/norm(mttrain,2);
        error_ell2P(i)=norm(mup-mttrain',2);
        error_ell2N(i)=norm(mun-mftrain',2);
        %error_ell1(i)=abs(ell1error_bar-ell1error_star)/ell1error_star;
        %error_ell2(i)=abs(ell2error_bar-ell2error_star)/ell2error_star;
        error_ell2(i)=abs(ell2error_bar-ell2error_star);
        X(i)=numTrainDat;
        error_ell2Psum(i)=error_ell2Psum(i)+error_ell2P(i);
        error_ell2Nsum(i)=error_ell2Nsum(i)+error_ell2N(i);
        error_ell2sum(i)=error_ell2sum(i)+error_ell2(i);
    end  
end
error_ell2=error_ell2sum/runNum;
error_ell2P=error_ell2Psum/runNum;
error_ell2N=error_ell2Nsum/runNum;
figure;hold on;

loglog(error_ell2,'-s','color','r');
loglog(error_ell2P,'-o','color','b');
loglog(error_ell2N,'-p','color','k');

% xt = get(gca, 'XTick');
% xtkvct = 2.^linspace(1, 2*size(xt,2), 2*size(xt,2));
% set(gca, 'XTick', xtkvct);
% set(gca, 'XMinorTick','on');
set(gca,'xticklabel',{'0','2^5','2^{10}','2^{15}'});
L = legend('$\Big| |\bar\mu_{+}-\bar\mu_{-}|_{2}-|\mu_{+}^{*}-\mu_{-}^{*}|_{2} \Big |$','$\qquad \quad |\bar\mu_{+}-\mu_{+}^{*}|_{2}$','$\qquad \quad |\bar\mu_{-}-\mu_{-}^{*}|_{2}$','Location','best');
set(L,'Interpreter','latex');
% %[L,icons] = legend({'|\bar\beta^{G} -\beta^{*}|_{\infty}','|\bar\beta -\beta^{*}|_{\infty}','|\bar\beta^{D} -\beta^{*}|_{\infty}'},'Interpreter','latex','Location','best');
set(L,'fontsize',20);
% %ylim([5.5 7]);
% %  for k = 1:3
% %     icons(k).FontSize = 16;
% %  end
set(gca,'FontSize',20);
xlabel('Traning Set Size');
ylabel('Error');
