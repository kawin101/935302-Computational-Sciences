/* 
กำหนดให้ A และ B เป็นเมทริกซ์ข้อมูลตัวเลข ขนาด 5x2 ทั้งคู่ 
ให้เขียนคำสั่งภาษา Scilab เพื่อหา C ที่เป็นผลคูณของ A กับ B แบบตำแหน่งต่อตำแหน่ง
*/
clc; clear all;
disp("Kawinphop Chomnikorn 633410142-5")
A = grand(5, 2, 'uin', 0, 20);
B = grand(5, 2, 'uin', 0, 20);
C = A.*B
disp(A)
disp(B)
disp(C)





