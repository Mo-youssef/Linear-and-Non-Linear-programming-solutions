function [Bf,b] = pivot(B,C,index)
    siz = size(B);
    i = index;
    A = [B,C];
    A(i,:) = A(i,:) .* (1/A(i,end));
    R = 1:siz(1);
    R = R(R~=i);
    for j = R
        A(j,:) = A(j,:) - A(i,:).*A(j,end);
    end
    Bf = A(:,1:end-2);
    b = A(:,end-1);
end