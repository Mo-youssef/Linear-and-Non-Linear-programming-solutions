function sig = getsig(J,rc,rb,X,S,mu,n,m)
x = diag(X);
s = diag(S);
Rs = [-rc;-rb;-X*S*ones(n,1)];
deltas = J\Rs;
deltax = deltas(1:n);
deltass = deltas(n+m+1:end);
a = x./deltax;
b = s./deltass;
alpri = min(-a(a<0));
aldual = min(-b(b<0));
alphapri = min(1,alpri);
alphadual = min(1,aldual);
if isempty(alphadual)
    alphadual = 0.9;
end
if isempty(alphapri)
    alphapri = 0.9;
end
muaff = ((x+alphapri.*deltax)'*(s+alphadual.*deltass))/n;
sig = (muaff/mu)^3;
end