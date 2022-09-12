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
//Genetic Algorithm; GA := population base method
//Parrent, Chromosome, gene, cross-over, mutation, selection 
//Original population of solutions NP 
NP = 50 // Number of Population
XO = grand(50, 2, 'unf',-5.0, 5.0);
XOZ = [];
//Evaluate the fitness function
for ip = 1:NP
    Z = Booth(XO(ip,1), XO(ip,2) )
    XOZ = [XOZ;  Z Z XO(ip,1) XO(ip,2) ]
end
sXOZ = gsort(XOZ, 'lr', 'i')
//disp(sXOZ)
for iG = 100000
// Generate(Build) new population by get 10 chromosome from top10 fitness
//of old propulation
// Random parrent from top10 to make new 20 chromosomes by Cross-over
// Random 20 chromosomes for new 20 cromosome by mutation
//1. selection Top10 best fitness functions
XN = sXOZ(1:10,3:4);
//disp(XN)
//2. Cross-over
for ic = 1:20
    // 'prm (random permutations)' สุ่มแบบไม่มีค่าซ้ำกันในช่วงความยาวของค่าตัวแปร
    ij = grand(1, 'prm', 1:10)
    XN(10+ic,1) = (XN(ij(1),1) + XN(ij(2),1) )/2.0
    XN(10+ic,2) = (XN(ij(1),2) + XN(ij(2),2) )/2.0
end
//disp(XN)
//3. Mutation
for ic = 1:20
    ij = grand(1,1, 'uin', 1,30)    //random chromosome
    gn = grand(1,1, 'uin', 1,3)    //random gene or both
    XN(30+ic,1) = XN(ij,1);
    XN(30+ic,2) = XN(ij,2);
    if gn == 1 then     
    XN(30+ic,1) = XN(ij,1) + grand(1,1, 'unf',-0.2,0.2) 
    elseif gn == 2 then
    XN(30+ic,2) = XN(ij,2) + grand(1,1, 'unf',-0.2,0.2)
    else
    XN(30+ic,1) = XN(ij,1) + grand(1,1, 'unf',-0.2,0.2) 
    XN(30+ic,2) = XN(ij,2) + grand(1,1, 'unf',-0.2,0.2)
    end
end
// Finish New Population
//disp(XN)
XNZ = [];
for ip = 1:NP
    Z = Booth(XN(ip,1), XN(ip,2) )
    XNZ = [XNZ;  Z Z XN(ip,1) XN(ip,2) ]
end
sXNZ = gsort(XNZ, 'lr', 'i')
//disp(sXNZ)
sXOZ = sXNZ
end
disp(abs(sXOZ(1,:)))
