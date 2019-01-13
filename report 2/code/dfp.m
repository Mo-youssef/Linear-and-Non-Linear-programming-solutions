function [optimal,itr] = dfp(func,grad,X,acc,maxitr)
i = 1;
n = length(X);
B(:,:,i) = eye(n);
X(:,i) = X;
G(:,i) = grad(X(:,i));
S(:,i) = - B(:,:,i) * G(:,i);
z = cubicinterconj(func,X(:,i),S(:,i),2,acc/1000,inf);
X(:,i+1) = X(:,i) + z.*S(:,i);
G(:,i+1) = grad(X(:,i+1));
while (norm(G(:,i+1)) > acc) && (i<maxitr)
    g = G(:,i+1)-G(:,i);
    M = (z/(S(:,i)'*g)).*S(:,i)*S(:,i)';
    N = -(1/(g'*B(:,:,i)*g)).*((B(:,:,i)*g)*(B(:,:,i)*g)');
    B(:,:,i+1) = M + N + B(:,:,i);
    i = i+1;
    if (mod(i,20) == 0)
        B(:,:,i) = eye(n);
    end
    S(:,i) = - B(:,:,i) * G(:,i);
    z = cubicinterconj(func,X(:,i),S(:,i),2,acc/1000,inf);
    X(:,i+1) = X(:,i) + z.*S(:,i);
    G(:,i+1) = grad(X(:,i+1));
end
optimal = X(:,i);
itr = i;
end