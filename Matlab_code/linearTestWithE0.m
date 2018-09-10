function [accuracy, F1, precision, recall] = linearTestWithE0(beta,tTestDat,fTestDat,tNum)
t_predicted = 1 * tTestDat * beta;
f_predicted = 1 * fTestDat * beta;
t=tNum;
all_predicted = vertcat(t_predicted, f_predicted);
sort(all_predicted);
tp_count = 0;
fp_count = 0;
tn_count = 0;
fn_count = 0;
%g = (maxall - minall)/gaps;

    for i=1:t
        if t_predicted(i)>=0
            tp_count=tp_count+1;
        else
            fn_count=fn_count+1;
        end    
        if f_predicted(i) < 0
            tn_count=tn_count+1;
        else
            fp_count=fp_count+1;
        end
    end
    accuracy=(tp_count+tn_count)/(2*t);
    precision= tp_count/(tp_count+fp_count);
    recall=tp_count/(tp_count+fn_count);
    F1=2*precision*recall/(precision+recall);

