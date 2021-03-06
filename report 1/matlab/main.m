clear;clc;
A = [2 1 -1 1 0 0 ;2 -1 5 0 1 0;4 1 1 0 0 1];
c_org = [-1 -2 -1];
b = [2 6 6 0]';
[obj, optimal, point] = revsimp2phase(c_org,A,b);
[obj1, optimal1, point1] = revsimp1phase(c_org,A,b);
f = [-1 -2 -1];
a = [2 1 -1;2 -1 5;4 1 1];
bb = [2 6 6];
lb = [0 0 0];
[x,fval,exitflag,output] = linprog(f,a,bb,[],[],lb);
plot(0:length(obj)-1,obj,'-o');
ylabel('Objctive value');
xlabel('iteration number');