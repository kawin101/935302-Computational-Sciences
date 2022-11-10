/*
8) กำหนด z = x^2 + y^2 ให้เขียนคำสั่งภาษา Scilab 
เพื่อหาค่า x, y ที่จะทำให้ได้ค่า z ต่ำที่สุด
*/
clc; clear all;
disp("Kawinphop Chomnikorn 633410142-5")
function fx=eventest(x1, x2)
    fx = x1^2 + x2^2
endfunction

//Original solution
xo = grand(1,1, 'unf',-5.0, 5.0);
yo = grand(1,1, 'unf',-5.0, 5.0);
slt_best = eventest(xo, yo);
p_best = [xo yo]; // p_best = point's best
xy = [xo yo];
//
for i = 1:100
// xn, yn ต้องใกล้ xo, yo
xn = xo + grand(1,1, 'unf',-1.8,1.8) //grand(1,1, 'nor', 0.0, 0.2)
yn = yo + grand(1,1, 'unf',-1.8,1.8) //grand(1,1, 'nor', 0.0, 0.2)
xy = [xy; xn yn];
z = eventest(xn, yn)
    if z <= slt_best then
        slt_best = z;
        p_best = [xn yn];
        xo = xn;
        yo = yn;
    end
//    xo = xn;
//    yo = yn;
end
disp("best solution, z, x, y")
disp([slt_best p_best])
disp(abs([slt_best p_best]))