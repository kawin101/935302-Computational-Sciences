/*
// if loop
clear all; clc;
// Dice, {1, 2, 3, 4, 5, 6}
n1=0; n2=0; n3=0; n4=0; n5=0; n6=0;
N=100000
for i=1:N
	y= grand(1, 1, "uin", 1 , 6)
if y==1 then
    n1=n1+1;
elseif y==2 then
  n2=n2+1;
elseif y==3 then
   n3=n3+1;
elseif y==4 then
   n4=n4+1;
elseif y==5 then
   n5=n5+1;
else
   n6=n6+1;
   end
  end
disp(([n1 n2 n3 n4 n5 n6]/N))
*/

// (for loop)
clear all; clc;
// Dice, {1, 2, 3, 4, 5, 6}
S=zeros(1,6)
N=100000
for i=1:N
    y = grand(1, 1, "uin", 1, 6)
    S(1,y) = S(1,y)+1
end
disp(S/N)

if sum([n1 n2 n3 n4 n5 n6]/N) == 1 then
    disp("true")
else 
    disp("false")
end
