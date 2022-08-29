// สร้างฟังก์ชันการทำงานจากใบงานที่ 4 กิจกรรรมที่ 1
clear all;
function fx=Booth(x1, x2)
fx1=(x1+(2*x2)+7)^2
fx2=((2*x1)+x2+5)^2
fx=fx1+fx2
endfunction
clc;
//Original solution
xo = grand(1,1, 'unf',-0.9, 0.9);
yo = grand(1,1, 'unf',-2.9, 2.9);
slt_best = Booth(xo, yo);
p_best = [xo yo];
xy = [xo yo];
//
for i = 1:1000
// xn, yn ต้องใกล้ xo, yo
xn = xo + grand(1,1, 'nor', 0.0, 0.2)
yn = yo + grand(1,1, 'nor', 0.0, 0.2)
/* กำหนด ขอบเขต กำแพงของ ช่วงการสุ่ม 
ถ้า ค่าที่สุ่มได้ มากกว่า จะกำหนดให้ เท่ากับ 5.0 ถึง -5.0 */
if xn  > 1.0 then xn = 1.0 end
if yn  > 3.0 then yn = 3.0 end
if xn  < -1.0 then xn = -1.0 end
if yn  < -3.0 then yn = -3.0 end
xy = [xy; xn yn];
z = Booth(xn, yn)
    if z <= slt_best then
        slt_best = z;
        p_best = [xn yn];
        //xo = xn;
        //yo = yn;
    end
    xo = xn;
    yo = yn;
end
disp("best solution, z, x, y")
disp([slt_best p_best])
clf;
plot(xy(:,1), xy(:,2), 'x')
plot(xy(1,1), xy(1,2), 'r+')
plot(p_best(1,1), p_best(1,2), 'g+' )
// ทำไม ค่าคำตอบที่ได้ ถึงไม่ใกล้เคียงกับ z = 0, x = 1, y = 3
//clf;
// ลองฝึกเขียน แบบ 3D
// scatter3d(xy(:,1), xy(:,2), 'x')
