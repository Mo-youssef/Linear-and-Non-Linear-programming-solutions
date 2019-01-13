function [optimal,itr] = marquardt(func,grad,hes,X,acc,alpha,c1,c2,maxitr)
i = 1;
n = length(X);
X(:,i) = X;
a(i) = alpha;
G(:,i) = grad(X(:,i));
F(i) = func(X(:,i));
while (norm(G(:,i)) > acc) && (i<maxitr)
    S(:,i) = -inv(hes(X(:,i))+a(i).*eye(n))*G(:,i);
    X(:,i+1) = X(:,i) + S(:,i);
    F(i+1) = func(X(:,i+1));
    while (F(i+1)>F(i))
        a(i) = c2 * a(i);
        S(:,i) = -inv(hes(X(:,i))+a(i).*eye(n))*G(:,i);
        X(:,i+1) = X(:,i) + S(:,i);
        F(i+1) = func(X(:,i+1));
    end
    a(i+1) = c1 * a(i);
    i = i+1;
    G(:,i) = grad(X(:,i));
    F(i) = func(X(:,i));
end
optimal = X(:,i);
itr = i;
end