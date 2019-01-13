clear;clc;
tic;
%[A,B,N,i] = fibosearch(0.01,0,10,@quadr)
%[Ag,Bg,ig] = golden(0.01,0,10,@quadr)
%[z,i] = quadinter(@quadr,0.1,0.01)
%[z,i] = cubicinter(@cub,@cderv,0.05,0.01,100000)
%[X,itr] = conjgrad(@rosenbrock,@rosenbrockgrad,@rosenhes,[-1.2;1],0.01,100000)
%[X,itr] = conjgrad(@powell,@powellder,@powellhes,[3;-1;0;1],0.01,100000)
%[X,itr] = marquardt(@rosenbrock,@rosenbrockgrad,@rosenhes,[-1.2;1],0.01,10000,0.25,2,100000)
%[X,itr] = marquardt(@powell,@powellder,@powellhes,[3;-1;0;1],0.01,10000,0.25,2,100000)
%[X,itr] = dfp(@powell,@powellder,[3;-1;0;1],0.01,100000)
%[X,itr] = dfp(@rosenbrock,@rosenbrockgrad,[-1.2;1],0.01,100000)
toc;