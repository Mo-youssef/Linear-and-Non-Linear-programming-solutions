function [X0,Y0,S0] = getstart(A,b,F)
[~,n] = size(A);
xt = A'*(A*A')^-1*b;
yt = (A*A')^-1 * A*F;
st = F-A'*yt;

sigx = max(-(3/2)*min(xt),0);
sigs = max(-(3/2)*min(st),0);

xb = xt + sigx.*ones(n,1);
sb = st + sigs.*ones(n,1);

sigxt = 0.5*(xb'*sb)/(ones(n,1)'*sb);
sigst = 0.5*(xb'*sb)/(ones(n,1)'*xb);

X0 = xb+sigxt.*ones(n,1);
Y0 = yt;
S0 = sb+sigst.*ones(n,1);
end