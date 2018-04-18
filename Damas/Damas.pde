
int[] depth = {2, 6}; // blue, red
String[] names = {"BLUE", "HAL"}; // blue, red
boolean pTurn = true; //blue starts
int players = 1;
boolean numbering = true;
String path = "D:/Repos/Inteligencia-Artificial/Tarea3";


// Colors: 
/*
Green {0, 155, 0};
Sea {0, 155, 100}
Blue {10, 60, 160}
Blue2 {20, 90, 170}
Yellow  {250,200,0}
Red {230,0,40}
Crown {230,230,50}

Wightish {240, 240, 240}
Black {10, 10, 10}
Blackish {70, 50, 70}

*/

int[] C1 = {230,0,40}; //LISP_PEG
int[] C2 = {20, 90, 170}; //PLAYER_PEG 
int[] C3 = {240, 240, 240}; //TILE_0
int[] C4 = {0, 155, 100}; //TILE_1
int[] C5 = {230,230,50}; //CROWN



import java.io.OutputStreamWriter;
import java.util.Scanner;

PShape crown;
int[] board;
int activePeg = -1;

boolean twoPlayers = false;

int selectedPeg = -1;
int[][][] diagonals;
Runtime rt = Runtime.getRuntime();
String[] AImoves = {};
int AIprog = 0;


void drawBoard(){
  int x;
  int y;
  
  for(int i = 0;i<64;i++){
    x = i%8;
    y = i/8;
    if((x+y)%2==0){
      fill(C3[0], C3[1], C3[2]);
    }else{
      fill(C4[0], C4[1], C4[2]);
    }
    rect(x*50,y*50,50,50);
    fill(0);

    if(numbering && (x+y)%2==1)
      text(str(i/2), x*50+2, y*50+8);
  }
  for(int i = 0; i < 32; i++){
    y = i/4;
    x = (i%4)*2 + (y+1)%2;
    int c = board[i];
    if(c != 0){
      if(c > 0){
        fill(C1[0], C1[1], C1[2]);
      }else{
        fill(C2[0], C2[1], C2[2]);
      }
      ellipse(x*50+25, y*50+25,40,40);
      ellipse(x*50+25, y*50+25,30,30);
      if(i == selectedPeg){
        fill(0);
        //ellipse(x*50+25, y*50+25, 2,2); // selected shape
        line(x*50+20, y*50+20, x*50+30, y*50+30);
        line(x*50+20, y*50+30, x*50+30, y*50+20);
      }
      
      if(abs(c) == 3){
        shape(crown, x*50+15, y*50-7); //CROWN POS
      }
    }
  }
}

int calcMaxEat(){
  int maxi = 0;
  for(int i = 0; i < 32; i++){
    int peg = board[i];
    if(pTurn ? peg<0 : peg>0){
      if(calcEat(i, board) == 1){println(i);}
      maxi = max(calcEat(i, board), maxi);
    }
  }
  return maxi;
}

int[] canEat(){
  int[] eat = new int[32];
  for(int i = 0; i < 32; i++){
     if(pTurn ? board[i]<0 : board[i]>0){
       eat[i] = calcEatSimple(i);
     }
  }
  return eat;
}

boolean gameOver(){
  for(int i = 0; i < 32; i++){
    if(pTurn ? board[i]<0 : board[i]>0){
      int[] m = getMoves(i);
      for(int j = 0; j < 4; j++){
        if(m[j] != -1){
          return false;
        }
      }
    }
  }
  return true;
}

int calcEat(int pos, int[] board){
  int[][] diag = diagonals[pos];
  int peg = board[pos];
  int[] b;
  int maxi = 0;

  boolean correctDir;
  for(int i = 0; i < 4; i++){
    correctDir = (abs(peg) == 3) || (peg == -1 && i<2) || (peg == 1 && i>=2); 
    if(correctDir && diag[i].length>1 && board[diag[i][0]]*peg < 0 && board[diag[i][1]] == 0){
      b = copyB(board);
      move(pos, diag[i][0], b, false);
      move(diag[i][0], diag[i][1], b, false);
      maxi = max(maxi, calcEat(diag[i][1], b) + 1);
    }
  }
  
  return maxi;
}

int calcEatSimple(int pos){
    int[][] diag = diagonals[pos];
  int peg = board[pos];
  boolean correctDir;
  for(int i = 0; i < 4; i++){
    correctDir = (abs(peg) == 3) || (peg == -1 && i<2) || (peg == 1 && i>=2); 
    if(correctDir && diag[i].length>1 && board[diag[i][0]]*peg < 0 && board[diag[i][1]] == 0){
      return 1;
    }
  }
  return 0;
}

void move(int from, int to, int[] board, boolean crown){
  int p = board[from];
  board[from] = 0;
  board[to] = p;
  if(crown){
    if(to < 4 && p == -1){
      board[to] = -3;
    }else if(to >=28 && p == 1){
      board[to] = 3; 
    }
  }
}

int distance(int x1, int y1, int x2, int y2){
  return (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2);
}

int[] getMoves(int pos){
  int[][] diag = diagonals[pos];
  int[] moves = new int[4];
  
  int peg = board[pos];
  
  boolean correctDir;
  for(int i = 0; i < 4; i++){
    moves[i] = -1;
    correctDir = (abs(peg) == 3) || (peg == -1 && i<2) || (peg == 1 && i>=2); 
    if(correctDir){
      if(diag[i].length>0 && board[diag[i][0]] == 0){
        moves[i] = diag[i][0];
      }else if(diag[i].length>1 && board[diag[i][0]]*peg < 0 && board[diag[i][1]] == 0){
        moves[i] = diag[i][1];
      }
    }
  }
  return moves;
}

int[] copyB(int[] board){
  int[] b = new int[board.length];
  for(int i = 0; i < board.length; i++){
    b[i] = board[i];
  }
  return b;
}

void mouseClicked(){
  if(!gameOver() && ((players == 1 && pTurn) || players == 2)){
    int mini = 1000000;
    int ind = 0;
  
    int x, y, d;
    for(int i = 0; i<32; i++){
      y = i/4;
      x = (i%4)*2 + (y+1)%2;
      x*=50;
      y*=50;
      x+=25;
      y+=25;
      d = distance(x, y, mouseX, mouseY);
      if(d < mini){
        mini = d;
        ind = i;
      }
    }

    int[] canMove = canEat();
    int s=0;
    for(int i = 0; i<32; i++){
      //print(canMove[i]);
      s= max(canMove[i],s); //1 if at least 1 can eat
    }
    if(activePeg == -1){
      if(selectedPeg != -1){
        int[] m = getMoves(selectedPeg);
        for(int i = 0; i < 4; i++){
          int[] diag = diagonals[selectedPeg][i];
          boolean eats = diag.length > 1 && ind == diag[1];
          if(m[i] == ind && (s == 0 || eats)){
            println(selectedPeg+" to "+ind);
            move(selectedPeg, diag[0], board, false);
            move(diag[0], ind, board, false); // does nothing if not eating

            if(eats && calcEat(ind, board) != 0){
              println("Ate "+diag[0]);
              selectedPeg = ind;
              activePeg = ind;
            }
            else{
              selectedPeg = -1;
              pTurn = !pTurn;

              println("Turn ended.\n");
              if(players == 2){
                println(names[pTurn?0:1]+"'s turn");
              }
            }
            move(ind, ind, board, true); //convert to King
            break;
          }
          if(i == 3){
            println("Can't move there");
          }
        } 
      }else{

        if(pTurn ? board[ind]<0 : board[ind]>0){
          int[] m = getMoves(ind);
          boolean hasMoves = false;
          for(int i = 0; i<4; i++){
            if(m[i] != -1){
              hasMoves = true;
              break;
            }
          }
          if(hasMoves){
            if(s == canMove[ind] ){
              for(int i = 0; i < 4; i++){
                if(m[i] != -1){
                  selectedPeg = ind;
                  println("Peg "+ind+" selected.");
                  break;
                }
              }
            }else{
              println("Can't select peg "+ind);
            }     
          }else{
            println("Peg "+ind+": No moves available");
          }
        }else{
          println("Peg "+ind+": Not your peg"); 
        }
      }
    }else{
      int[] m = getMoves(activePeg);
      for(int i = 0; i < 4; i++){
        int[] diag = diagonals[activePeg][i];
        if(diag.length > 1 && m[i] == ind && ind == diag[1]){
          println(activePeg+" to "+ind);
          move(activePeg, diag[0], board, false);
          move(diag[0], ind, board, false);
          if(calcEat(ind, board) != 0){
            println("Ate "+diag[0]);
            selectedPeg = ind;
            activePeg = ind;
          }
          else{
            selectedPeg = -1;
            activePeg = -1;
            pTurn = !pTurn;
            println("Turn ended.\n");
            if(players == 2){
              println(names[pTurn?0:1]+"'s turn");

            }
          }
          move(ind, ind, board, true); //convert to King
          break;
        }
        if(i == 3){
          println("Can't move peg "+selectedPeg+" to "+ind);
        }
      }
    }
  drawBoard();
  }
}

void moveAI(int m, int n){
  println(m+" to "+n);
  for(int j = 0; j < 4; j++){
    int[] diag = diagonals[m][j];
    boolean in = false;
    for(int d = 0; d<min(diag.length,2); d++){
      if(diag[d] == n){
        in = true;
        break;
      }
    }
    if(in){
      move(m, diag[0], board, true);
      move(diag[0], n, board, true); // does nothing if not eating
      break;
    }
  }

}

String boardToLisp(){
   String s = "(";
   for(int i = 0; i < 32; i++){
     s+="("+str(i)+" . "+str(board[i])+")";
   }
   s+=")";
   return s;
}

String getAIMove() throws IOException{
  
  String lispBoard = boardToLisp();
  String[] cmd = {"clisp", "alphabeta.lsp", str(depth[pTurn?0:1]), lispBoard, (players==1 || !pTurn) ?"T":"Nil"};
  Process pr = rt.exec(cmd, null, new File(path));
  InputStream stdout = pr.getInputStream(); 
  Scanner scan = new Scanner(stdout);
  String ans = "";
  while(scan.hasNextLine()){
    ans = scan.nextLine();
    println(ans);

  }
  scan.close();
 
  pr.destroy();
  return ans;
}

void setup(){
  size(400,400);
  background(255);
  
  textSize(8);
  
  crown = createShape();
  crown.beginShape();
  crown.fill(C5[0], C5[1], C5[2]);
  crown.vertex(0, 3);
  crown.vertex(0, 15);
  crown.vertex(20, 15);
  crown.vertex(20, 3);
  crown.vertex(15, 9);
  crown.vertex(10, -1);
  crown.vertex(5, 9);
  crown.endShape(CLOSE);
  
  diagonals = makeDiag();             // fill board
  board = new int[32]; 
  for(int i = 0; i < 12; i++){
    board[i] = 1;
    board[31-i] = -1;
  }  

  names[0] += players == 0 ? depth[0] + "000":"";
  names[1] += players <= 1 ? depth[1] + "000":"";

  //board[9] = -1;  
  //board[30] = 0;
  
  drawBoard();
  if(players == 2 || (players == 1 &&pTurn)){
    println(names[pTurn?0:1]+"'s turn");
  }
}

void draw(){
  if(gameOver()){
    noLoop();
    String s ="";
    int len = (pTurn ? names[1]:names[0]).length();
    for(int i = 0; i < 36-len/2; i++){ //80 equals signs - len( wins!!!) = 36
      s+=" ";
    }
    println("\n\n\n================================================================================\n     ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    println(s+(pTurn ? names[1]:names[0])+" WINS!!!");
    println("     ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n================================================================================\n");
    textSize(45);
    textAlign(CENTER);
    fill(255,220);
    rect(0,150,400,50);
    if(pTurn){
      fill(C1[0],C1[1],C1[2]);
    }
    else{
      fill(C2[0],C2[1],C2[2]);
    }
    text((pTurn ? names[1]:names[0])+" WINS!!!", width/2, height/2-8);
  }
  else if(!pTurn && players == 1 || players == 0){ // AI behavior
    try{
      if(AIprog == 0){
        println(names[pTurn?0:1]+" plays...  ");

        String m = getAIMove();
        AImoves = m.replace(".","").replace("  "," ").split(" ");
        AImoves[0] = AImoves[0].substring(1);
        AImoves[AImoves.length-1] = AImoves[AImoves.length-1].replace(")", "");
      }
      moveAI(int(AImoves[AIprog]), int(AImoves[AIprog+1]));
      AIprog++;
      drawBoard();
      if(AImoves.length - AIprog == 1){
        pTurn = !pTurn;
        println("Trun ended.\n");
        if(players == 1)
          println(names[pTurn?0:1]+"'s turn");
        AIprog = 0;
      }
      delay(250);
    }
    catch(IOException e){println(e);}  
  }
}


int[][][] makeDiag(){
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
  return diagonal;
}
