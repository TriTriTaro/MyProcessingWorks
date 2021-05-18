int size = 2 * 8;

String[][] cell = new String[size][size];
String turn;

float d = 800.0/size;

void setup() {
  for (int i = 0; i < size; i++)
    for (int j = 0; j < size; j++)
      cell[i][j] = "green";


  cell[1][1] = "white";
  cell[1][2] = "white";
  cell[1][3] = "white";
  cell[size - 2][size - 1] = "black";
  cell[size - 2][size - 2] = "black";
  cell[size - 2][size - 3] = "black";

  /*
  cell[size/2-2][size/2-2] = "black";
   cell[size/2-1][size/2-1] = "black";
   cell[size/2-1][size/2-2] = "black";
   cell[size/2-2][size/2-1] = "black";
   
   cell[size/2]  [size/2] = "black";
   cell[size/2+1][size/2] = "black";
   cell[size/2+1][size/2+1] = "black";
   cell[size/2]  [size/2+1] = "black";
   
   cell[size/2-2][size/2] = "white";
   cell[size/2-1][size/2] = "white";
   cell[size/2-1][size/2+1] = "white";
   cell[size/2-2][size/2+1] = "white";
   
   cell[size/2]  [size/2-2] = "white";
   cell[size/2+1][size/2-1] = "white";
   cell[size/2+1][size/2-2] = "white";
   cell[size/2]  [size/2-1] = "white";
   */
  turn = "white";


  size(800, 800);
  frameRate(7);
}

void draw() {
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      switch(cell[i][j]) {
      case "white":
        fill(255);
        break;
      case "black":
        fill(0);
        break;
      case "green":
        fill(#006A06);
        break;
      default:
        println("cell bug tteru");
      }
      square(d*i, d*j, d);
    }
  }

  lifeUpdate();
}

void mousePressed() {
  int i = floor(mouseX/(800.0/size));
  int j = floor(mouseY/(800.0/size));
  println(i+","+j);
  if (cell[i][j] == "green") {
    flip(i, j);
    changeTurn();
  }
}

void flip(int i, int j) {
  cell[i][j] = turn;

  for (int v=-1; v<=1; v++) {
    for (int h=-1; h<=1; h++) {
      if (v == 0 && h == 0) {
        continue;
      }
      for (int d=1; (v*d+i < size) && (v*d+i >= 0) && (h*d+j < size) && (h*d+j >= 0); d++) {
        if (cell[v*d+i][h*d+j] == turn) {
          for (int m=d; m>0; m--) {
            cell[v*m+i][h*m+j] = turn;
          }
          break;
        } else if (cell[v*d+i][h*d+j] == "green") {
          break;
        }
      }
    }
  }
}

void changeTurn() {
  if (turn == "white") {
    turn = "black";
  } else if (turn == "black") {
    turn = "white";
  } else {
    println("turn bug tteru");
  }
}

void lifeUpdate() {
  int[][] count = new int[size][size];

  for (int i = 0; i<size; i++) {
    for (int j = 0; j<size; j++) {
      count[i][j] += (cell[i][(size+j-1) % size] == turn) ? 1 : 0;
      count[i][j] += (cell[i][(size+j+1) % size] == turn) ? 1 : 0;
      count[i][j] += (cell[(size+i-1) % size][j] == turn) ? 1 : 0;
      count[i][j] += (cell[(size+i-1) % size][(size+j-1) % size] == turn) ? 1 : 0;
      count[i][j] += (cell[(size+i-1) % size][(size+j+1) % size] == turn) ? 1 : 0;
      count[i][j] += (cell[(size+i+1) % size][j] == turn) ? 1 : 0;
      count[i][j] += (cell[(size+i+1) % size][(size+j-1) % size] == turn) ? 1 : 0;
      count[i][j] += (cell[(size+i+1) % size][(size+j+1) % size] == turn) ? 1 : 0;
    }
  }

  for (int i = 0; i<size; i++) {
    for (int j = 0; j<size; j++) {
      if (cell[i][j] == "green" && count[i][j] == 3) {
        cell[i][j] = turn;
      } else if (cell[i][j] == turn && (count[i][j] == 3 || count[i][j] == 2)) {
        cell[i][j] = turn;
      } else if (cell[i][j] == turn) {
        cell[i][j] = "green";
      }
    }
  }
}
