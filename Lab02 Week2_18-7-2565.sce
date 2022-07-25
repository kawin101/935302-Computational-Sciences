clear all; clc;
// Dice, {1, 2, 3, 4, 5, 6}
S=zeros(1,18)
N=10000000;3
for i=1:N
    y = grand(1, 3, "uin", 1, 6)
    sy = sum(y)
    S(1,sy) = S(1,sy)+1
end
disp(S/N)
disp(sum(S/N))

if (sum(S/N)) == 1 then
    disp("true")
else 
    disp("false")
end

