function [MSX]=makespan(A, X)
[mP nP]=size(X);
MSX=[]
for ip=1:mP
P=X(ip,:);
[mA nA]=size(A);
tm=zeros(mA, nA);
for j=1:nA
for i=1:mA
if (i==1) then
if(j==1) then
tm(i,j)=tm(i,j)+A(i,P(j));
T(i,j)=tm(i,j);
else
tm(i,j)=tm(i,j-1)+A(i,P(j));
T(i,j)=tm(i,j);
end
else
if (j==1) then
tm(i,j)=tm(i-1,j)+A(i,P(j));
T(i,j)=tm(i,j);
else
tm(i,j)=max(tm(i-1,j),tm(i,j-1))+A(i,P(j));
T(i,j)=tm(i,j);
end
end
end
end
makes=T($,$);
MSX=[MSX;makes];
end
endfunction

A =[34 20 57 47 62 40 74 94  9 62 86 13 78 46 83 52 13 70 40 60;
  5 48 80 43 34  2 87 68 28 84 30 35 42 39 85 34 36  9 96 84;
 86 35  5 93 74 12 40 95 80  6 92 14 83 49 36 38 43 89 94 33;
 28 39 55 21 25 88 59 40 90 18 33 10 59 92 15 77 31 85 85 99;
  8 91 45 55 75 18 59 86 45 89 11 54 38 41 64 98 83 36 61 19];

X = grand(100 ,'prm',[1:20])
[MSX]=makespan(A, X)
MSX_X = [MSX X ];
sort_MSX_X = gsort(MSX_X,'lr','d')
disp(MSX_X($,:))
