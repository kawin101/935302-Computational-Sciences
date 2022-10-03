clc; clear all;
// Solution
/* S1 = 1* 3 4* | 2* 5 6
S2 = 2 1* 4* | 3* 6 5
S3 = 1 3 4 2 6 5
S4 = 2 1 4 3 5 6 */

// Basic Cross-over 
S1 = [1 3 4 2 5 6]; // Dad
S2 = [2 1 4 3 6 5]; // Mom

//S3 = [S1(1:3), S2(4:6)] // ต่อแนว

S3 = [S2(4:6)] // 3 6 5
S3(find(S3==3)) = [] // 0 6 5
newS3 = [S1(4), S3] // 2 6 5
S3 = [S1(1:3), newS3] // 1 3 4 2 6 5
disp('Cross-over is S3 = ',S3)

S4 = [S1(4:6)] // 2 5 6
S4(find(S4==2)) = [] // 0 5 6
newS4 = [S2(4), S4] // 3 5 6
S4 = [S2(1:3), newS4] // 2 1 4 3 5 6
disp('Cross-over is S4 = ',S4)
