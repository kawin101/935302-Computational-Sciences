clc; clear all; clf;
filename = fullfile('D:\Work\935302_Computational Science', "SUN.csv")
M = csvRead(filename, ',', [], 'string', [], [], [], 0)
Date = M(2:$,1);
[m n ] = size(Date);
Days = [1:m]';
High = strtod(M(2:$,2));
Low = strtod(M(2:$,3));
Open = strtod(M(2:$,4));
Close = strtod(M(2:$,5));
Volume = strtod(M(2:$,6));
AdjClose = strtod(M(2:$,7));
subplot(2,2,1)
plot(Days, High, 'b');
xlabel('days')
ylabel('Baht')
xtitle('SUN year market')
subplot(2,2,1)
plot(Days, Low, 'r');
xlabel('days')
ylabel('Baht')
subplot(2,2,2)
bar(Days, Close-Open, 'b');
subplot(2,2,3)
xlabel('Baht')
histplot(20, Close, normalization=%t, style=16, rect=[4.0, 0.0, 10.0, 0.8]);
xtitle('Close Histprogram')
subplot(2,2,4)
plot(Close, Volume/1000000.0, 'xr');
xlabel('Baht')
ylabel('Million Baht')
xtitle('Close vs Volume')

