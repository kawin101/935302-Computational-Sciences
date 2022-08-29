// 15-8-2565 ตัวอย่างของอาจารย์.
// in Classroom (3.การวิเคราะห์เชิงคณิตศาสตร์และเชิงตัวเลข).
// command under post.
function fx=rast(x1, x2)
    A=10;
    n=2;
    fx1 = x1^2-A*cos(2*%pi*x1);
    fx2 = x2^2-A*cos(2*%pi*x2);
    fx = A*n+(fx1+fx2)
endfunction
//my function Rastrigin 2 Vector
//function fx=rastV(x1,x2)
//A=10; n=2;
//fx = A*n+x1.^2+x2.^2-A*cos(2*%pi*x1)-A*cos(2*%pi*x2)
//endfunction
//
//function fx = rastriginV ( x1 , x2 )
//    // Vectorized function for contouring.
//    fx = 10*2+x1.^2 + x2.^2-cos(10*2*%pi*x1)-cos(10*2*%pi*x2)
//endfunction
//
//clf;
//x=linspace(-5.0,5.0,100); 
//y= linspace(-5.0,5.0,100); 
//[XX,YY]=meshgrid(x,y);
//Z = rastV(XX,YY);
//scf()
//plot3d(x1,x2,Z')
//
//clf;
//x=grand(100000,1,'unf',-5.0,5.0); 
//y=grand(100000,1,'unf',-5.0,5.0); 
//z = rast(x, y);
//fx = x.^2-A*cos(2*%pi*x);
//fy = y.^2-A*cos(2*%pi*y);
//z = A*n+(fx+fy)
//slt = [z x y];
//sort_slt = gsort(slt,'lr','i')
//disp(sort_slt(1,:))
//scatter3d(x,y,z,'.')
//--------------------------
clc; 
slt_best = 1000
p_best = [];
//slt=[]
for i=1:10000000
x=grand(1,1,'unf',-5.0,5.0); 
y=grand(1,1,'unf',-5.0,5.0); 
z = rast(x, y)
    if z < = slt_best then
        slt_best = z;
        p_best = [x y] ;
    end
end
//slt = [slt;[z x y]] 
disp("minimum value is ", [x y z])
//disp(slt)
//sort_slt = gsort(slt,'lr','i')
//disp("minimum value is ", sort_slt(1,:))
//scatter3d(slt(:,2),slt(:,3),slt(:,1), '.')


