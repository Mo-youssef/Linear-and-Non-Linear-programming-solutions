function [y,yeq] = constraint(X)
y = X(2)^2 + X(1)^2 - 1;
yeq = [];
end