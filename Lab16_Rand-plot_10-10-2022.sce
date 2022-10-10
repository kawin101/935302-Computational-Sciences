clf()
X = grand(1000, 1, 'nor', 0.0, 1.0);
Y = grand(1000, 1, 'nor', 0.0, 1.0);
subplot(2,2,1)
plot(X, Y, 'ro')
xtitle('normal a=0.0, std=1.0');
X1 = grand(1000, 1, 'unf', 0.0, 1.0);
Y1 = grand(1000, 1, 'unf', 0.0, 1.0);
subplot(2,2,2)
plot(X1, Y1, 'bo')
X2 = grand(1000, 1, 'nor', 1.0, 1.0);
Y2 = grand(1000, 1, 'nor', 1.0, 1.0);
xtitle('uniform min=0.0, max=1.0');
subplot(2,2,3)
plot(X2, Y2, 'ro')
