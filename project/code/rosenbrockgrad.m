function Y = rosenbrockgrad(X)
Y = [-400*X(1)*(X(2)-X(1)^2)-2*(1-X(1));
    200*(X(2)-X(1)^2)];
end