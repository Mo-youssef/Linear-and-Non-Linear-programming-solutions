function z = cubicinterconj(func,X,S,t,acc,maxiter)
A = 0;
r = 100000;
%fa = func(X+A.*S);
da = (func(X+(A+acc/r).*S)-func(X+(A-acc/r).*S))/(2*acc/r);
fb = func(X+t.*S);
db = (func(X+(t+acc/r).*S)-func(X+(t-acc/r).*S))/(2*acc/r);
i=0;
while (da * db > 0) && (i<maxiter) 
   % fa = fb;
    da = db;
    A = t;
    t = 2*t;
    fb = func(X+t.*S);
    db = (func(X+(t+acc/r).*S)-func(X+(t-acc/r).*S))/(2*acc/r);   
    i=i+1;
    if abs(da) < acc
        break;
    end
    if abs(db) < acc
        break;
    end
end
B = t;
fb = func(X+t.*S);
fa = func(X+A.*S);
i = 0;
flag = 0;
if abs(da) < acc
    z = A;
    flag = 1;
end
if abs(db) < acc
    z = B;
    flag = 1;
end
while (i < maxiter) && (flag == 0)
    Z = (3*(fa-fb)/(B-A))+da+db;
    Q = sqrt(Z^2 - da*db);
    z1 = A + ((da+Z+Q)*(B-A)/(da+db+2*Z));
    z2 = A + ((da+Z-Q)*(B-A)/(da+db+2*Z));
    if func(X+z1.*S) < func(X+z2.*S)
        z = z1;
    else 
        z = z2;
    end
    dz = (func(X+(z+(acc/r)).*S)-func(X+(z-acc/r).*S))/(2*acc/r);
    if abs(dz) < acc
        flag = 1;
    end
    if da * dz >= 0 
        A = z;
        fa = func(X+z.*S);
        da = dz;
    else
        B = z;
        fb = func(X+z.*S);
        db = dz;
    end
    i = i+1;
end
end