function [point, optimal, obj, XX, SS] = central(F,A,b,X0,S0,Y0,sig,alpha,T)
[m,n] = size(A);
X=diag(X0);
S=diag(S0);
J = [zeros(n) A' eye(n);A zeros(m,n) zeros(m);S zeros(n,m)  X];
mu = sum(sum(X*S))/n;
x=X0;
y=Y0;
s=S0;
t = inf;
obj = F'*X0;
XX = X0;
SS = S0;
while t>T
    J = [zeros(n) A' eye(n);A zeros(m,n) zeros(m);S zeros(n,m)  X];
    rc = A'*y + s - F;
    rb = A*x - b;
    Rs = [-rc;-rb;-X*S*ones(n,1)+sig.*mu.*ones(n,1)];
    deltas = J\Rs;
    %[alphaprim, alphadual] = getalpha(x,s,deltas,n,m,ne);
    alphaprim = alpha;
    alphadual = alpha;
    x = x + alphaprim .* deltas(1:n);
    y = y + alphadual .* deltas(n+1:n+m);
    s = s + alphadual .* deltas(n+m+1:end);
    X=diag(x);
    S=diag(s);
    mu = sum(sum(X*S))/n;
    t = mu*n;
    obj = [obj F'*x];
    XX = [XX x];
    SS = [SS s];
end
point = x;
optimal = obj(end);
end