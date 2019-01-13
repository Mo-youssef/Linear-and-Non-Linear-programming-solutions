function [A,B,i] = golden(acc,A,B,func)
L0 = B-A;
err = inf;
i = 0;
while err>acc
    L1 = B-A;
    L2 = 0.618 * L1;
    x1 = B - L2;
    x2 = A + L2;
    f1 = func(x1);
    f2 = func(x2);
    if f1>f2
        A = x1;
    elseif f1 == f2
        A=x1;
        B=x2;
    else
        B = x2;
    end
    err = (B-A)/L0;
    i = i+1;
end
end
