clc; clf;
ds = 0.0:1.0:500
disp(ds)
ps0 = 1.0./(exp(ds./100))
ps1 = 1.0./(exp(ds./300))
ps2 = 1.0./(exp(ds./500))
disp(ps)
plot(ds,ps0,'red',ds,ps1,'blue',ds,ps2,'green')


disp(ps)
plot(ds,ps)
