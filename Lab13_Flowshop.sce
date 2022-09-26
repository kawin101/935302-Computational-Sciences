// FlowShop
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
//////////////////////////////////////////////////////////////
// เขียน Flow Chart ได้คะแนนเพิ่ม
clc;
A = [54 83 15 71 77 36 53 38 27 87 76 91 14 29 12 77 32 87 68 94
79 3 11 99 56 70 99 60 5 56 3 61 73 75 47 14 21 86 5 77
16 89 49 15 89 45 60 23 57 64 7 1 63 41 63 47 26 75 77 40
66 58 31 68 78 91 13 59 49 85 85 9 39 41 56 40 54 77 51 31
58 56 20 85 53 35 53 41 69 13 86 72 8 49 47 87 58 18 68 28];
disp(A);
/* หาค่าแนวกับหลักของเมทริก A 
//ถ้าตอนเปลี่ยนค่า A ใหม่ ไม่ต้องกังวลเรื่องกำหนด แนวกับหลักของเมทริก A 
*/
[mA, nA] = size(A); // nA is number of job
//disp([mA nA])
XO = grand(1, 'prm', 1:nA)
// ********* X1 = grand(1, 'prm', 1:nA)
//********* X2 = grand(1, 'prm', 1:nA)
[MSX] = makespan(A, XO);
disp([MSX, XO]);
MSXbest = MSX;
Xbest = XO;
nrand = 100000
for i = 1:nrand
    // Cross-over Random
    rn = grand(1, 'prm', 1:nA)
    xp1 = XO(rn(1)); 
    xp2 = XO(rn(2)); 
    Xn = XO;
    Xn(rn(1)) = xp2;
    Xn(rn(2)) = xp1;
    //disp([rn(1) rn(2) Xn])
    //Xn = grand(1, 'prm', 1:nA) // Simple Random
   [MSXn] = makespan(A, Xn);
   if MSXn <= MSXbest then
       MSXbest = MSXn
       Xbest = Xn
        XO = Xn; // XO มีค่าเท่ากับ Xn
   end
end
disp([MSXbest, Xbest])

// i = 100,000
/*
column 1 to 9
   1278.   17.   9.   15.   6.   5.   3.   1.   13.
         column 10 to 18
   2.   7.   11.   8.   4.   19.   14.   18.   16.
         column 19 to 21
   10.   20.   12.
*/

/*
// การ Cross-over ของ X1 and X2 (Line 51,52)
-3-> X1;

-3-> X2;

-3-> X31 = X1 (1:10)
 X31  = 

   1.   2.   3.   4.   5.   6.   7.   8.   9.   10.

-3-> X32 = setdiff(X2,X31)
 X32  = 

   11.
   12.
   13.
   14.
   15.
   16.
   17.
   18.
   19.
   20.

-3-> X2;

-3-> X2;
*/
