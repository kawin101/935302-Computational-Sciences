// intercept
clear all; clc;
x = [1 3 5 7 10 12 13 16 18 20];
y = [4 5 6 5 8 7 6 9 12 11];
n = 10;
sxy = sum(x.*y);
sxsy = sum(x)*sum(y);
sxx = sum(x.*x);
sx2 = sum(x)^2;
a1 = (n*sxy - sxsy)/(n*sxx-sx2);
a0 = mean(y)-a1*mean(x)
ym = a0+a1*x 
disp([a0 a1])
plot(x,y,'o',x,ym)

