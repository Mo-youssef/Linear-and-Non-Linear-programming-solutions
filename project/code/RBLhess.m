function Y = RBLhess(X)
Y = [-400*X(2)+1200*X(1)^2+2+2*X(3)   -400*X(1);
    -400*X(1)   200+2*X(3)];
end