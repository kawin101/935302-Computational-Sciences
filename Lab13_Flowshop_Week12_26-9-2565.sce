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
A = [ 34 20 57 47 62 40 74 94  9 62 86 13 78 46 83 52 13 70 40 60
  5 48 80 43 34  2 87 68 28 84 30 35 42 39 85 34 36  9 96 84
 86 35  5 93 74 12 40 95 80  6 92 14 83 49 36 38 43 89 94 33
 28 39 55 21 25 88 59 40 90 18 33 10 59 92 15 77 31 85 85 99
  8 91 45 55 75 18 59 86 45 89 11 54 38 41 64 98 83 36 61 19];
//disp(A);
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
// Defult Result = 1565
column 1 to 8
   1565.   20.   5.   12.   1.   19.   10.   14.
         column 9 to 17
   13.   3.   17.   11.   15.   18.   9.   16.   6.
         column 18 to 21
   8.   7.   4.   2.
// The best of result = 1278 
column 1 to 9
   1207.   17.   2.   16.   18.   12.   9.   19.   10.
         column 10 to 19
   14.   1.   7.   8.   20.   5.   13.   15.   6.   4.
         column 20 to 21
   3.   11.
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
*/
