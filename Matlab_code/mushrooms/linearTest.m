function [accuracy, F1, precision, recall,F1Max,AccMax, tp_count, fp_count, prediction] = linearTest(beta,tTestDat,fTestDat,tNum)
t_predicted = 1 * tTestDat * beta;
f_predicted = 1 * fTestDat * beta;
t=tNum;
all_predicted = vertcat(t_predicted, f_predicted);
sort(all_predicted);
tp_count = zeros(2*t,1);
fp_count = zeros(2*t,1);
tn_count = zeros(2*t,1);
fn_count = zeros(2*t,1);
%g = (maxall - minall)/gaps;

for j=1:2*t
    for i=1:t
        if t_predicted(i) >= all_predicted(j)
            tp_count(j)=tp_count(j)+1;
            prediction(j,i)=1;
        else
            fn_count(j)=fn_count(j)+1;
            prediction(j,i)=0;
        end    
        if f_predicted(i) < all_predicted(j)
            tn_count(j)=tn_count(j)+1;
            prediction(j,t+i)=0;
        else
            fp_count(j)=fp_count(j)+1;
            prediction(j,t+i)=1;
        end
    end
    accuracy(j)=(tp_count(j)+tn_count(j))/(2*t);
    precision(j)= tp_count(j)/(tp_count(j)+fp_count(j));
    recall(j)=tp_count(j)/(tp_count(j)+fn_count(j));
    F1(j)=2*precision(j)*recall(j)/(precision(j)+recall(j));

end
F1Max = max(F1);
AccMax = max(accuracy);

