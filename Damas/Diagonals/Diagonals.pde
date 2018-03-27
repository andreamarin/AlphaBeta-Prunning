int[][][] diagonal = new int[32][][];
int n;
int[] i; 
for(int j = 0; j < 32; j++){
  diagonal[j] = new int[4][]; 
}


//0
n = 0;

i = new int[]{};
diagonal[n][0] = i;

i = new int[]{};
diagonal[n][1] = i;

i = new int[]{5, 9, 14, 18, 23, 27};
diagonal[n][2] = i;

i = new int[]{4};
diagonal[n][3] = i;

//1
n = 1;

i = new int[]{};
diagonal[n][0] = i;

i = new int[]{};
diagonal[n][1] = i;

i = new int[]{6, 10, 15, 19};
diagonal[n][2] = i;

i = new int[]{5, 8, 12};
diagonal[n][3] = i;

//2 
n = 2;

i = new int[]{};
diagonal[n][0] = i;

i = new int[]{};
diagonal[n][1] = i;

i = new int[]{7, 11};
diagonal[n][2] = i;

i = new int[]{6, 9, 13, 16, 20};
diagonal[n][3] = i;

//3 
n = 3;

i = new int[]{};
diagonal[n][0] = i;

i = new int[]{};
diagonal[n][1] = i;

i = new int[]{};
diagonal[n][2] = i;

i = new int[]{7, 10, 14, 17, 21, 24, 28};
diagonal[n][3] = i;

//4
n = 4;

i = new int[]{};
diagonal[n][0] = i;

i = new int[]{0};
diagonal[n][1] = i;

i = new int[]{8, 13, 17, 22, 26, 31};
diagonal[n][2] = i;

i = new int[]{};
diagonal[n][3] = i;

//5
n = 5;

i = new int[]{0};
diagonal[n][0] = i;

i = new int[]{1};
diagonal[n][1] = i;

i = new int[]{9, 14, 18, 23, 27};
diagonal[n][2] = i;

i = new int[]{8, 12};
diagonal[n][3] = i;

//6
n = 6;

i = new int[]{1};
diagonal[n][0] = i;

i = new int[]{2};
diagonal[n][1] = i;

i = new int[]{10, 15, 19};
diagonal[n][2] = i;

i = new int[]{9, 13, 16, 20};
diagonal[n][3] = i;

//7
n = 7;

i = new int[]{2};
diagonal[n][0] = i;

i = new int[]{3};
diagonal[n][1] = i;

i = new int[]{11};
diagonal[n][2] = i;

i = new int[]{10, 14, 17, 21, 24, 28};
diagonal[n][3] = i;

//8
n = 8;

i = new int[]{4};
diagonal[n][0] = i;

i = new int[]{5, 1};
diagonal[n][1] = i;

i = new int[]{13, 17, 22, 26, 31};
diagonal[n][2] = i;

i = new int[]{12};
diagonal[n][3] = i;

//9
n = 9;

i = new int[]{5, 0};
diagonal[n][0] = i;

i = new int[]{6, 2};
diagonal[n][1] = i;

i = new int[]{14, 18, 23, 27};
diagonal[n][2] = i;

i = new int[]{13, 16, 20};
diagonal[n][3] = i;

//10
n = 10;

i = new int[]{6, 1};
diagonal[n][0] = i;

i = new int[]{7, 3};
diagonal[n][1] = i;

i = new int[]{15, 19};
diagonal[n][2] = i;

i = new int[]{14, 17, 21, 24, 28};
diagonal[n][3] = i;

//11
n = 11;

i = new int[]{7, 2};
diagonal[n][0] = i;

i = new int[]{};
diagonal[n][1] = i;

i = new int[]{};
diagonal[n][2] = i;

i = new int[]{15, 18, 22, 25, 29};
diagonal[n][3] = i;

//12
n = 12;

i = new int[]{};
diagonal[n][0] = i;

i = new int[]{8, 5, 1};
diagonal[n][1] = i;

i = new int[]{16, 21, 25, 30};
diagonal[n][2] = i;

i = new int[]{};
diagonal[n][3] = i;

//13
n = 13;

i = new int[]{8, 4};
diagonal[n][0] = i;

i = new int[]{9, 6, 2};
diagonal[n][1] = i;

i = new int[]{17, 22, 26, 31};
diagonal[n][2] = i;

i = new int[]{16, 20};
diagonal[n][3] = i;

//14
n = 14;

i = new int[]{9, 5, 0};
diagonal[n][0] = i;

i = new int[]{10, 7, 3};
diagonal[n][1] = i;

i = new int[]{18, 23, 27};
diagonal[n][2] = i;

i = new int[]{17, 21, 24, 28};
diagonal[n][3] = i;

//15
n = 15;

i = new int[]{10, 6, 1};
diagonal[n][0] = i;

i = new int[]{11};
diagonal[n][1] = i;

i = new int[]{19};
diagonal[n][2] = i;

i = new int[]{18, 22, 25, 29};
diagonal[n][3] = i;

//16
n = 16;

i = new int[]{12};
diagonal[n][0] = i;

i = new int[]{13, 9, 6, 2};
diagonal[n][1] = i;

i = new int[]{21, 25, 30};
diagonal[n][2] = i;

i = new int[]{20};
diagonal[n][3] = i;

//17
n = 17;

i = new int[]{13, 8, 4};
diagonal[n][0] = i;

i = new int[]{14, 10, 7, 3};
diagonal[n][1] = i;

i = new int[]{22, 26, 31};
diagonal[n][2] = i;

i = new int[]{21, 24, 28};
diagonal[n][3] = i;

//18
n = 18;

i = new int[]{14, 9, 5, 0};
diagonal[n][0] = i;

i = new int[]{15, 11};
diagonal[n][1] = i;

i = new int[]{23, 27};
diagonal[n][2] = i;

i = new int[]{22, 25, 29};
diagonal[n][3] = i;

//19
n = 19;

i = new int[]{15, 10, 6, 1};
diagonal[n][0] = i;

i = new int[]{};
diagonal[n][1] = i;

i = new int[]{};
diagonal[n][2] = i;

i = new int[]{23, 26, 30};
diagonal[n][3] = i;

//20
n = 20;

i = new int[]{};
diagonal[n][0] = i;

i = new int[]{16, 13, 9, 6, 2};
diagonal[n][1] = i;

i = new int[]{24, 29};
diagonal[n][2] = i;

i = new int[]{};
diagonal[n][3] = i;

//21
n = 21;

i = new int[]{16, 12};
diagonal[n][0] = i;

i = new int[]{17, 14, 10, 7, 3};
diagonal[n][1] = i;

i = new int[]{25, 30};
diagonal[n][2] = i;

i = new int[]{24, 28};
diagonal[n][3] = i;

//22
n = 22;

i = new int[]{17, 13, 8, 4};
diagonal[n][0] = i;

i = new int[]{18, 15, 11};
diagonal[n][1] = i;

i = new int[]{26, 31};
diagonal[n][2] = i;

i = new int[]{25, 29};
diagonal[n][3] = i;

//23
n = 23;

i = new int[]{18, 14, 9, 5, 0};
diagonal[n][0] = i;

i = new int[]{19};
diagonal[n][1] = i;

i = new int[]{27};
diagonal[n][2] = i;

i = new int[]{26, 30};
diagonal[n][3] = i;

//24
n = 24;

i = new int[]{20};
diagonal[n][0] = i;

i = new int[]{21, 17, 14, 10, 7, 3};
diagonal[n][1] = i;

i = new int[]{29};
diagonal[n][2] = i;

i = new int[]{28};
diagonal[n][3] = i;

//25
n = 25;

i = new int[]{21, 16, 12};
diagonal[n][0] = i;

i = new int[]{22, 18, 15, 11};
diagonal[n][1] = i;

i = new int[]{30};
diagonal[n][2] = i;

i = new int[]{29};
diagonal[n][3] = i;

//26
n = 26;

i = new int[]{22, 17, 13, 8, 4};
diagonal[n][0] = i;

i = new int[]{23, 19};
diagonal[n][1] = i;

i = new int[]{31};
diagonal[n][2] = i;

i = new int[]{30};
diagonal[n][3] = i;

//27
n = 27;

i = new int[]{23, 18, 14, 9, 5, 0};
diagonal[n][0] = i;

i = new int[]{};
diagonal[n][1] = i;

i = new int[]{};
diagonal[n][2] = i;

i = new int[]{31};
diagonal[n][3] = i;

//28
n = 28;

i = new int[]{};
diagonal[n][0] = i;

i = new int[]{24, 21, 17, 14, 10, 7, 3};
diagonal[n][1] = i;

i = new int[]{};
diagonal[n][2] = i;

i = new int[]{};
diagonal[n][3] = i;

//29
n = 29;

i = new int[]{24, 20};
diagonal[n][0] = i;

i = new int[]{25, 22, 18, 15, 11};
diagonal[n][1] = i;

i = new int[]{};
diagonal[n][2] = i;

i = new int[]{};
diagonal[n][3] = i;

//30
n = 30;

i = new int[]{25, 21, 16, 12};
diagonal[n][0] = i;

i = new int[]{26, 23, 19};
diagonal[n][1] = i;

i = new int[]{};
diagonal[n][2] = i;

i = new int[]{};
diagonal[n][3] = i;

//31
n = 31;

i = new int[]{26, 22, 17, 13, 8, 4};
diagonal[n][0] = i;

i = new int[]{27};
diagonal[n][1] = i;

i = new int[]{};
diagonal[n][2] = i;

i = new int[]{};
diagonal[n][3] = i;

