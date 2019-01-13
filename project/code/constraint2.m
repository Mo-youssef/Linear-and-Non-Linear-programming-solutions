function [y,yeq] = constraint2(X)
y = [0.6/X(1) + 0.3464/X(2) - 0.1;
    6-X(1);
    7-X(2)];
yeq = [];
end