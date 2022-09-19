// Simple Random
clear all;
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

clc;
//กำหนดเมตริกซ์ตารางงาน
A = [54 83 15 71 77 36 53 38 27 87 76 91 14 29 12 77 32 87 68 94
79 3 11 99 56 70 99 60 5 56 3 61 73 75 47 14 21 86 5 77
16 89 49 15 89 45 60 23 57 64 7 1 63 41 63 47 26 75 77 40
66 58 31 68 78 91 13 59 49 85 85 9 39 41 56 40 54 77 51 31
58 56 20 85 53 35 53 41 69 13 86 72 8 49 47 87 58 18 68 28];
//ตารางงานแบบเรียงตามลำดับเลขงาน
X1 = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
//ตารางแบบเรียงสุ่มเลขงาน
X2 = grand(4, 'prm', 1:20); //สุ่มแบบเรียงสับเปลี่ยน

//ตารางงานรวม
X = [X1;X2];
//หาค่า makespan จากลำดับ X
//[MSX]=makespan(A, X);
//disp([MSX,X])

slt_best = makespan(A, X);
p_best = [A, X]; // p_best = point's best
xy = [A, X];
//
for i = 1:1000
    
// xn, yn ต้องใกล้ xo, yo
xn = A + grand(1,1, 'unf',-1.8,1.8) //grand(1,1, 'nor', 0.0, 0.2)
yn = X + grand(1,1, 'unf',-1.8,1.8) //grand(1,1, 'nor', 0.0, 0.2)
xy = [xy; A, X];
z = makespan(A, X);
    if z <= slt_best then
        slt_best = z;
        p_best = [A, X];
        xo = xn;
        yo = yn;
    end
end
sort_slt_best = gsort(slt_best, 'r', 'd')
disp("best solution, z, x, y")
//disp([slt_best])
disp(slt_best($,:))
//disp(abs([slt_best p_best]))
