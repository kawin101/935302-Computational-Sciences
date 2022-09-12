// สร้างฟังก์ชันการทำงานจากใบงานที่ 4 กิจกรรรมที่ 1
// Hill-Climbing Search 
// Draw Flow Chart Hill Climbing, เขียน Flow Chart ประกอบ ใบงานให้สมบูรณ์
clear all;
function fx=Booth(x1, x2)
fx1=(x1+(2*x2)+7)^2
fx2=((2*x1)+x2+5)^2
fx=fx1+fx2
endfunction
clc;
//Original solution
xo = grand(1,1, 'unf',-5.0, 5.0);
yo = grand(1,1, 'unf',-5.0, 5.0);
slt_old = Booth(xo, yo); // solution's old ค่าคำตอบเก่า
slt_best = Booth(xo, yo); // solution's best ค่าคำตอบใหม่ ที่ดีที่สุด
p_best = [xo yo]; // p_best = point's best
xy = [xo yo];
//
T = 1000;
for i = 1:300000
// xn, yn ต้องใกล้ xo, yo
xn = xo + grand(1,1, 'unf',-1.8,1.8) //grand(1,1, 'nor', 0.0, 0.2)
yn = yo + grand(1,1, 'unf',-1.8,1.8) //grand(1,1, 'nor', 0.0, 0.2)
/* กำหนด ขอบเขต กำแพงของ ช่วงการสุ่ม 
ถ้า ค่าที่สุ่มได้ มากกว่า จะกำหนดให้ เท่ากับ 5.0 ถึง -5.0 */
// Boundary Condition
if xn  > 5.0 then xn = 5.0 end
if yn  > 5.0 then yn = 5.0 end
if xn  < -5.0 then xn = -5.0 end
if yn  < -5.0 then yn = -5.0 end
//xy = [xy; xn yn];
z = Booth(xn, yn)
    if z <= slt_old then
        slt_old = z;
        xo = xn;
        yo = yn;
        if z <= slt_best then
        slt_best = z;
        p_best = [xn yn];
        end
    else    // Hill-Climbing
        rs = grand(1,1, 'unf', 0.0, 1.0) // Random solution
        //ds ==> 0, ps --> 1.0
        ds = z-slt_old; //difference solution
        if modulo(i,10000) == 1 then T=T*0.9; disp(T) end
        if T <= 100 then T = 100 end  
        ps = 1.0/(exp(ds/T)) // T is variable decreasing with iteration
        //if rs > 0.5 then // simple Hill Climbing
        if ps > rs then // Simulated Annealing
        slt_old = z
        xo = xn;
        yo = yn;
        end
    end  
end
disp("best solution, z, x, y")
disp([slt_best p_best])
disp(abs([slt_best p_best]))
//clf;
//plot(xy(:,1), xy(:,2), 'o')
//plot(xy(1,1), xy(1,2), 'r+')
//plot(p_best(1,1), p_best(1,2), 'g+' )
//xx = -5.0:0.1:5.0;
//yy = xx;
// [xxx yyy] = meshgrid(xx,yy)
//zzz = Booth(xxx, yyy);
//plot3d(xxx, yyy, zzz)
//scatter3d(xxx, yyy, zzz)
// ทำไม ค่าคำตอบที่ได้ ถึงไม่ใกล้เคียงกับ z = 0, x = 1, y = 3

