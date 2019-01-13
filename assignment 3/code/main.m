clear;clc;
% A = [2 1 1 0;1 3 0 1];
% F = [-30; -20 ;0;0];
% b = [8;8];
% Am = [2 1;1 3];
% bm = [8 8];
% Fm = [-30 -20];
% A = [1 1 1];
% F = [-1.1;-1;0];
% b = 6;
% Am = [1 1];
% bm = 6;
% Fm = [-1.1 -1];
A = [2 1 -1 1 0 0;2 -1 5 0 1 0;4 1 1 0 0 1];
F = [-1; -2 ;-1;0;0;0];
b = [2;6;6];
Am = [2 1 -1;2 -1 5;4 1 1];
bm = [2 6 6];
Fm = [-1 -2 -1];

T = 0.001;
[X0,Y0,S0] = getstart(A,b,F);
% X0 = [0;0;0;2;6;6];
% S0 = [1;1;1;1;1;1];
sig = 0.5;
alpha = 0.9;
ne = 0.9;
[pointc, optimalc, objc, XXc, SSc] = central(F,A,b,X0,S0,Y0,sig,alpha,T);
[pointca, optimalca, objca, XXca, SSca] = centraladaptive(F,A,b,X0,S0,Y0,T,ne);
[pointm, optimalm, objm, XXm, SSm] = mehrotra(F,A,b,X0,S0,Y0,T,ne);
options = optimoptions('linprog','Algorithm','interior-point-legacy');
[x,fval,exitflag,output] = linprog(Fm,Am,bm,[],[],zeros(size(Fm)),[],options);
figure 
%subplot(1,3,1)
plot(-objc);
xlabel('iteration');
ylabel('objective function');
subplot(1,3,2)
plot(XXc(1,:),XXc(2,:),'-x');
xlabel('x1');
ylabel('x2');
subplot(1,3,3)
plot(XXc(1,:).*SSc(1,:),XXc(2,:).*SSc(2,:),'-x');
xlabel('x1*s1');
ylabel('x2*s2');
figure 
subplot(1,3,1)
plot(-objca);
xlabel('iteration');
ylabel('objective function');
subplot(1,3,2)
plot(XXca(1,:),XXca(2,:),'-x');
xlabel('x1');
ylabel('x2');
subplot(1,3,3)
plot(XXca(1,:).*SSca(1,:),XXca(2,:).*SSca(2,:),'-x');
xlabel('x1*s1');
ylabel('x2*s2');
figure 
subplot(1,3,1)
plot(-objm);
xlabel('iteration');
ylabel('objective function');
subplot(1,3,2)
plot(XXm(1,:),XXm(2,:),'-x');
xlabel('x1');
ylabel('x2');
subplot(1,3,3)
plot(XXm(1,:).*SSm(1,:),XXm(2,:).*SSm(2,:),'-x');
xlabel('x1*s1');
ylabel('x2*s2');