/*
6) ให้เขียนคำสั่งภาษา Scilab กำหนดค่าตัวแปล x และ y เป็นเลขสุ่มที่มีการกระจายปกติ ขนาด 1x100 พร้อมคำสั่งเขียนกราฟกระจายจุด x กับ y สองมิติ
*/
clc; clear all; clf;
disp("Kawinphop Chomnikorn 633410142-5")
x = grand(1, 100, 'uin', 0, 20)
y = grand(1, 100, 'uin', 0, 20)
scatter(x, y, 'x')
