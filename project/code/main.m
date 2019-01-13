clear;clc;
X0 = [0;0;1];
n = 2;
acc1 = 0.00001;
acc2 = 0.00001;
maxitr = 1000;
tic
% SQP is seqbuicnwwic quadlad
[optimal,X,obj,itr] = SQP(@rosenbrock,@rosenbrockgrad,@RBLhess,@constraint,@constraintgrad,@(x) [],@(x) [],X0,n,acc1,acc2,maxitr);
toc
%%
clear;clc;
X0 = [11.8765;7;1;1;1];
n = 2;
acc1 = 0.0001;
acc2 = 0.0001;
maxitr = 1000;
tic
[optimal,X,obj,itr] = SQP(@truss,@trussgrad,@TLhess,@constraint2,@constraint2grad,@(x) [],@(x) [],X0,n,acc1,acc2,maxitr);
toc
%%
figure
plot(obj)
title('objective function')
xlabel('iteration')
ylabel('cost')
figure
plot(X(1,:),X(2,:))
title('point progression')
xlabel('x1')
ylabel('x2')
%%
clear;clc;
options = optimoptions('fmincon','Algorithm','sqp');
tic
[x,fval,ext,output] = fmincon(@rosenbrock,[0,0],[],[],[],[],[],[],@constraint,options);
toc
%%
clear;clc;
options = optimoptions('fmincon','Algorithm','sqp');
tic
[x,fval,ext,output] = fmincon(@truss,[11.8765,7],[],[],[],[],[],[],@constraint2,options);
toc