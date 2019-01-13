function y = rosenhes(X)
y = [-400*X(2)+1200*X(1)^2     -400*X(1);
    -400*X(1)                  200];
end