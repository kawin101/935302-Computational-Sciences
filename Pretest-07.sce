/*
ุ7) กำหนด z = x^2 + y^2 ให้เขียนคำสั่งภาษา Scilab เขียนกราฟสามมิติ ของ x,y,z
*/
disp("Kawinphop Chomnikorn 633410142-5")
function fx=eventest(x1, x2)
    fx = x1^2 + x2^2
endfunction
// linspaceเรทสเปต(ต่ำสุดด,สูงสุด,จำนวน...ตัว)
x1=linspace(-5.0,5.0,100) ;
x2=linspace(-5.0,5.0,100);
// meshgrid(x1,x2); มัดเกรด ใช้เป็นคู่อันดับ
[X,Y] = meshgrid(x1,x2);
Z= eventest( X , Y );
scf();
plot3d1(x1,x2, Z')
