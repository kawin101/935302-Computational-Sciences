// intercept
clear all; clc; clf;
x = [1 3 5 7 10 12 13 16 18 20];
y = [4 5 6 5 8 7 6 9 12 11];
a0b = 100; a1b = 100; Serrb = 100;
for i = 1:1000000
    a0 = grand(1,1,'unf',0.0,5.0);//Random a0
    a1 = grand(1,1,'unf',0.0,5.0);//Random a1
    ym = a0+a1*x; err = y-ym;
    Serr2 = sum(err.*err); //Sum.Error.^2
if Serr2 < Serrb then 
    a0b = a0; a1b = a1; //a1.Best 
    Serrb = Serr2; //Sum.Error.Best
    disp([a0b a1b Serr2])
    end
end
plot(x,y,'o',x,ym, '+',x,ym)
