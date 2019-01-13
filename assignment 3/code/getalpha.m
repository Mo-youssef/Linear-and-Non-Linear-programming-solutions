function [alphaprim, alphadual] = getalpha(x,s,deltas,n,m,ne)
deltax = deltas(1:n);
deltass = deltas(n+m+1:end);
a = x./deltax;
b = s./deltass;
alpri = min(-a(a<0));
aldual = min(-b(b<0));
alphaprim = min(1,ne*alpri);
alphadual = min(1,ne*aldual);
if isempty(alphadual)
    alphadual = 0.01;
end
if isempty(alphaprim)
    alphaprim = 0.01;
end
end