function [A,B,N,i] = fibosearch(acc,A,B,func)
F(1)=1;
F(2)=1;
l=3;
F(l) = F(1)+F(2);
xx = (B-A)/acc;
while F(l)<xx
    l=l+1;
    F(l) = F(l-1)+F(l-2);
end
N=l;
L1=B-A;
L2 = (F(N-2)/F(N))*L1;
J=2;
i = 0;
while J<N
    L1 = B-A;
    if L2 < L1/2
        x1 = A+L2;
        x2 = B-L2;
    else
        x1 = B-L2;
        x2 = A+L2;
    end
    f1 = func(x1);
    f2 = func(x2);
    if f1>f2
        A = x1;
        L1 = B-A;
        L2 = (F(N-J)/F(N-J+2)) * L1;
    elseif f1 == f2
        A = x1;
        B = x2;
        L1 = B-A;
        L2 = (F(N-J)/F(N-J+2)) * L1;
    else
        B = x2;
        L1 = B-A;
        L2 = (F(N-J)/F(N-J+2)) * L1;
    end
    J = J+1;
    i = i+1;
end
end