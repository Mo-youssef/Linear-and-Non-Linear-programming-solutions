function [obj, optimal, point] = revsimp1phase(c,A,b)
siz = size(A);
m = siz(1);
n = siz(2);
c_org = [c zeros(1,n-length(c))];
At = [A zeros(m,1); c_org 1];
B = At(:,n-m+1:n+1);
C = c_org;
obj = 0;
invar = n-m+1:n;
outvar = 1:n-m;
while(true)
    cn = c_org(end,:)+B(end,1:end-1)*A;
    C = [C; cn];
    if cn>=0
        break;
    end
    [value,index1] = min(cn);
    Ai = B(1:end-1,1:end-1) * A(:,index1);
    ratio = b(1:end-1)./Ai;
    ratio(ratio<=0) = NaN;
    [~,index2] = min(ratio);
    [B,b] = pivot([B b],[Ai;value],index2);
    x = invar(index2);
    invar(index2) = outvar(index1);
    outvar(index1) = x;
    obj = [obj -b(end)];
end
optimal = obj(end);
point = zeros(1,n);
for i = 1:m
    point(invar(i)) = b(i);
end
end