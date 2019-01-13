function [z,i] = quadinter(func,t,acc)
A = 0;
fa = func(A);
f1 = func(t);
if f1 >= fa
    fc = f1;
    fb = func(t/2);
    B = t/2;
    t = t/2;
else
    flag = 0;
    while flag == 0
        fb = f1;
        B = t;
        f2 = func(2*t);
        if f2 >= f1
            fc = f2;
            flag = 1;
        else
            f1 = f2;
            t = 2*t;
        end
    end
end
flag = 0;
i=1;
while flag == 0
    z = ((4*fb - 3*fa - fc)/(4*fb - 2*fa -2*fc))*t;
    fz = func(z);
    hz = fa + ((4*fb - 3*fa - fc)/(2*t))*z + ((fc + fa - 2*fb)/(2*t^2))*z^2;
    err = abs((hz-fz)/fz);
    if err > acc
        if z > B
            if fz > fb
                fc = fz;
            else
                fa = fb;
                fb = fz;
            end
        else
            if fz > fb
                fa = fz;
            else
                fc = fb;
                fb = fz;
            end
        end
    else
        flag = 1;
    end
    i = i+1;
end
end