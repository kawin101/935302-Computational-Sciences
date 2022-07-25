clear all; clc; clf;
//x=grand(1,1000, 'unf', -2.0, 2.0);
//y=grand(1,1000, 'unf', 0.0, 1.0);
//plot(x,y,'o')

//x0=grand(1,1000, 'nor', 0.0, 1.0);
//y0=grand(1,1000, 'nor', 0.0, 1.0);
//x1=grand(1,1000, 'nor', 5.0, 1.0);
//y1=grand(1,1000, 'nor', 5.0, 1.0);
//x2=grand(1,1000, 'nor', 3.0, 1.0);
//y2=grand(1,1000, 'nor', 2.0, 1.0);
//plot(x0,y0,'ro')
//plot(x1, y1, 'g+')
//plot(x2, y2, 'b*')

x0=grand(1,100000, 'unf', 0.0, 1.0);
y0=grand(1,100000, 'unf', 0.0, 1.0);
x1=grand(1,1000, 'unf', -5.0, 1.0);
y1=grand(1,1000, 'unf', -5.0, 1.0);
plot(x0,y0,'ro')
plot(x1,y1,'g+')
