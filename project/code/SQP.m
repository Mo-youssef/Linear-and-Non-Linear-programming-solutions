function [optimal,X,obj,itr] = SQP(func,grad,Lhess,IEconstraint,IEconstraintgrad,Econstraint,Econstraintgrad,X,n,acc1,acc2,maxitr)
% X is an initial point of X and lambda
% n is vector length
i = 1;
X(:,i) = X;
obj(i) = func(X(:,i));
err1 = inf;
err2 = inf;
while ((err1 > acc1) || (err2 > acc2)) && (i<maxitr)
    df = grad(X(:,i));
    L2 = Lhess(X(:,i));
    g = IEconstraint(X(:,i));
    dg = IEconstraintgrad(X(:,i));
    h = Econstraint(X(:,i));
    dh = Econstraintgrad(X(:,i));
    Q = @(p) df'*p + 0.5*p'*L2*p;
    options = optimoptions('fmincon','Display','off');
    S = fmincon(Q,zeros(n,1),dg',-g,dh',-h,[],[],[],options);
    lambda = -([dh dg])\(df+L2*S);
    X(1:n,i+1) = X(1:n,i)+S;
    X(n+1:end,i+1) = lambda;
    i = i+1;
    obj(i) = func(X(:,i));
    err1 = norm(X(1:n,i)-X(1:n,i-1));
    err2 = abs((func(X(:,i))-func(X(:,i-1)))/func(X(:,i-1)));
end
optimal = X(:,i);
itr = i;
end