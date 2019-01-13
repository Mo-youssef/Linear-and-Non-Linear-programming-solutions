function [optimal,itr] = conjgrad(func,grad,hes,X,acc,maxitr)
i = 1;
X(:,i) = X;
S(:,i) = -grad(X(:,i));
if (S(:,i) == 0)
    error('initial point is optimum');
end
%Sn(:,i) = S(:,i)./norm(S(:,i));
Sn(:,i) = S(:,i);
%z = quadinterconj(func,X(:,i),S(:,i),0.05,0.0001);
%z = cubicinterconj(func,X(:,i),Sn(:,i),2,acc/1000,inf);
z = (-Sn(:,i)'*grad(X(:,i)))/(Sn(:,i)'*hes(X(:,i))*Sn(:,i));
i = i+1;
X(:,i) = X(:,i-1) + z.* Sn(:,i-1);
while (norm(grad(X(:,i))) > acc) && (i<maxitr)
    S(:,i) = -grad(X(:,i)) + ((norm(grad(X(:,i)))^2)/(norm(grad(X(:,i-1)))^2)).*Sn(:,i-1);
    %Sn(:,i) = S(:,i)./max(S(:,i));
    Sn(:,i) = S(:,i);
    %z = quadinterconj(func,X(:,i),S(:,i),0.05,0.0001);
    %z = cubicinterconj(func,X(:,i),Sn(:,i),0.05,acc,inf);
    z = (-Sn(:,i)'*grad(X(:,i)))/(Sn(:,i)'*hes(X(:,i))*Sn(:,i));
    i = i+1;
    X(:,i) = X(:,i-1) + z.* Sn(:,i-1);
end
optimal = X(:,i);
itr = i;
end