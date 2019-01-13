clear;clc;
x = 0:0.001:3;
for i = 1:length(x)
b(:,i) = [1;0.4082] + x(i).*[-1.2;1];
end
for i = 1:length(x)
r(i) = rosenbrock(b(:,i));
end
plot(x,r)
% x = 0:0.0001:0.3;
% for i = 1:length(x)
% b(:,i) = [0.0708;-0.0063;0.0303;0.0322] + x(i).*[-0.773;1.0518;-1.3679;0.6721];
% end
% for i = 1:length(x)
% r(i) = powell(b(:,i));
% end
% plot(x,r)
%z = cubicinterconj(@rosenbrock,[-1.2;1],[1;0.4082],3,0.0001,100000);
%z = cubicinterconj(@rosenbrock,[-1;1],[1;1],3,0.0001,100000);
% z = cubicinterconj(@rosenbrock,[1.4411;2.0775],[-0.2148;-0.6203],3,0.0001,100000);