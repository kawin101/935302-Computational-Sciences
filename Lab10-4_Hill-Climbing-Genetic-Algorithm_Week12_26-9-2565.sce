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
NG = 1000; // Number of generations
NP = 100; // Number of Populations
NOld = 20; // Number of old and strong
NCr = 40; // Number of cross-over
NMu = 30; // Number of mutation
NAl = 10;  // Number of ALien
// Generate original poppulation
XO = grand(NP, 2, 'unf',-5.0, 5.0);
XOZ = [];
//Evaluate the fitness function
for ip = 1:NP
    Z = Booth(XO(ip,1), XO(ip,2) )
    XOZ = [XOZ;  Z Z XO(ip,1) XO(ip,2) ]
end
sXOZ = gsort(XOZ, 'lr', 'i')
sXOZ1 = sXOZ;
//disp(sXOZ)
for iG = 1:NG
// Generate(Build) new population by get NOld chromosome from NOld fitness
//of old propulation
// Random parrent from NOld to make new NCr chromosomes by Cross-over
// Random NMu chromosomes for new NMu cromosome by mutation
//1. selection NOld best fitness functions
XN = sXOZ(1:NOld,3:4);
//disp(XN)
//2. Cross-over with alpha paramerter (0.0-1.0)
alpha = 0.5
for ic = 1:NCr
    // 'prm (random permutations)' สุ่มแบบไม่มีค่าซ้ำกันในช่วงความยาวของค่าตัวแปร
    ij = grand(1, 'prm', 1:NOld)
    XN(NOld+ic,1) = alpha*XN(ij(1),1) + (1.0-alpha) *XN(ij(2),1) 
    XN(NOld+ic,2) = alpha*XN(ij(1),2) + (1.0-alpha) *XN(ij(2),2) 
end
//disp(XN)
//3. Mutation
NPn = NOld+NCr // sum is 30 
for ic = 1:NMu
    ij = grand(1,1, 'uin', 1,NPn)    //random chromosome
    gn = grand(1,1, 'uin', 1,3)    //random gene or both
    XN(NPn+ic,1) = XN(ij,1);
    XN(NPn+ic,2) = XN(ij,2);
    if gn == 1 then     
    XN(NPn+ic,1) = XN(ij,1) + grand(1,1, 'unf',-0.2,0.2) 
    elseif gn == 2 then
    XN(NPn+ic,2) = XN(ij,2) + grand(1,1, 'unf',-0.2,0.2)
    else
    XN(NPn+ic,1) = XN(ij,1) + grand(1,1, 'unf',-0.2,0.2) 
    XN(NPn+ic,2) = XN(ij,2) + grand(1,1, 'unf',-0.2,0.2)
    end
end
// Generate new NAL ALiens
XNA = grand(NAl , 2, 'unf',-5.0, 5.0);
//
XN = [XN;XNA]
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
disp(abs(([sXOZ1 sXOZ])))
//disp(abs(sXOZ1(1,:)))
//disp(abs(sXOZ(1,:)))
