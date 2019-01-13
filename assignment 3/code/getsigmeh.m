function sig = getsigmeh(deltax,deltass,x,s,mu,n)
a = x./deltax;
b = s./deltass;
alpri = min(-a(a<0));
aldual = min(-b(b<0));
alphapri = min(1,alpri);
alphadual = min(1,aldual);
if isempty(alphadual)
    alphadual = 1;
end
if isempty(alphapri)
    alphapri = 1;
end
muaff = ((x+alphapri.*deltax)'*(s+alphadual.*deltass))/n;
sig = (muaff/mu)^3;
end