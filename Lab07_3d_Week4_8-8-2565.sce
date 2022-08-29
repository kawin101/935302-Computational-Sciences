clc; clear all; 
//1. เขียนกราฟสามมิติของฟังก์ชันทดสอบ (Booth function)
/*
function fx=Booth(x1, x2)
fx1=(x1+(2*x2)+7)^2
fx2=((2*x1)+x2+5)^2
fx=fx1+fx2
endfunction
//// linspace()
x1=linspace(-5.0,5.0,100) ;
x2=linspace(-5.0,5.0,100);
[X,Y] = meshgrid(x1,x2);
Z= Booth( X , Y );
//disp(Z)
//mesh(X,Y,Z)
scf();
plot3d1(x1,x2,Z')
*/

//2. หาจุดต่ำสุดของฟังก์ชันที่ทดสอบ

///Booth function 
function fx=Booth(x1, x2)
fx1=(x1+(2*x2)+7)^2
fx2=((2*x1)+x2+5)^2
fx=fx1+fx2
endfunction

slt=[];
////for ทำซ้ำ
for i=1:10000
/// grand สุ่มมา
x=grand(1,1,'unf',-10.0,10.0); 
y=grand(1,1,'unf',-10.0,10.0); 
z = Booth(x, y) 
//// slt = [เมทริกซ์ sltใหม่;[ เมทริกซ์ z x y] ]
slt = [slt;[z x y]] 
//แสดงเมทริกซ์ค่า x  y  z
//disp([x y z])
//ทำให้ x อยู่บนภาพ 3d
//scatter3d(x,y,z,'x')
end 
//หาจุดต่ำสุด ที่ f(x,y)=0 ค่า z
///gsort ใช้เรียงลำดับค่าน้อย
sort_slt = gsort(slt,'lr','i')
disp(sort_slt(1,:))
///abs() เพื่อให้ค่าที่ออกเป็น+ ดูสวย
disp(abs(sort_slt(1,:)))
//คำสั่งแสดงผลแบบรูป 3 มิติ อยู่นอกรูป for จะแสดงเมื่อคำนวณรูปเสร็จ
scatter3d(slt(:,2),slt(:,3),slt(:,1), '.')
/*
