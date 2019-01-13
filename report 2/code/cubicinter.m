function [z,i] = cubicinter(func,derv,t,acc,maxiter)
A = 0;
fa = func(A);
da = derv(A);
fb = func(t);
db = derv(t);
i=0;
while (da * db > 0) && (i<maxiter) 
    fa = fb;
    da = db;
    A = t;
    t = 2*t;
    fb = func(t);
    db = derv(t);    
    i=i+1;
end
B = t;
i = 1;
flag = 0;
while (i < maxiter) && (flag == 0)
    Z = (3*(fa-fb)/(B-A))+da+db;
    Q = sqrt(Z^2 - da*db);
    z1 = A + ((da+Z+Q)*(B-A)/(da+db+2*Z));
    z2 = A + ((da+Z-Q)*(B-A)/(da+db+2*Z));
    if func(z1) < func(z2) 
        z = z1;
    else 
        z = z2;
    end
    dz = derv(z);
    if abs(dz) < acc
        flag = 1;
    end
    if da * dz >= 0 
        A = z;
        fa = func(z);
        da = dz;
    else
        B = z;
        fb = func(z);
        db = dz;
    end
    i = i+1;
end
end