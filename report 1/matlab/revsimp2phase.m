function [obj, optimal, point] = revsimp2phase(c,A,b)
siz = size(A);
m = siz(1);
n = siz(2);
c_org = [c zeros(1,n-length(c))];
A_fp = [A eye(m) zeros(m,1) zeros(m,1);c_org zeros(1,m) 1 0; -sum(A(1:end,:)) zeros(1,m+1) 1];
b_fp = [b;-sum(b(1:end-1))];
B_fp = A_fp(:,n+1:end);
c_org_fp = [c_org zeros(1,m)];
d_org = A_fp(end,1:n+m);
invar = n+1:n+m;
outvar = 1:n;
obj = 0;
while(true)
    cn_fp = c_org_fp + B_fp(end-1,1:end-2)*A_fp(1:end-2,1:end-2);
    dn_fp = d_org + B_fp(end,1:end-2)*A_fp(1:end-2,1:end-2);
 %   C_fp = [C_fp; cn_fp];
    if dn_fp>=-0.00000000000001
        if b_fp(end)~=0
            error('no feasible point');
        else
            break;
        end
    end
    [value,index1] = min(dn_fp);
    Ai_fp = B_fp(1:end-2,1:end-2) * A_fp(1:m,index1);
    ratio_fp = b_fp(1:end-2)./Ai_fp;
    ratio_fp(ratio_fp<0) = NaN;
    [~,index2] = min(ratio_fp);
    [B_fp,b_fp] = pivot([B_fp b_fp],[Ai_fp;cn_fp(index1);value],index2);
    x = invar(index2);
    invar(index2) = outvar(index1);
    outvar(index1) = x;
    obj = [obj -b_fp(end-1)];
end

B = B_fp(1:end-1,1:end-1);
b = b_fp(1:end-1);
invar = invar(invar<=n);
outvar = outvar(outvar<=n);
while(true)
    cn = c_org+B(end,1:end-1)*A;
    if cn>=-0.000000000000001
        break;
    end
    [value,index1] = min(cn);
    Ai = B(1:end-1,1:end-1) * A(:,index1);
    ratio = b(1:end-1)./Ai;
    ratio(ratio<=0) = NaN;
    [~,index2] = min(ratio);
    [B,b] = pivot([B b],[Ai;value],index2);
    x = invar(index2);
    invar(index2) = outvar(outvar == index1);
    outvar(outvar == index1) = x;
    obj = [obj -b(end)];
end
optimal = obj(end);
point = zeros(1,n);
for i = 1:m
    point(invar(i)) = b(i);
end
end