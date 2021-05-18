int N = 4;
ArrayList<Integer> barA = new ArrayList<Integer>();
ArrayList<Integer> barB = new ArrayList<Integer>();
ArrayList<Integer> barC = new ArrayList<Integer>();

ArrayList<ArrayList<Integer>> bar = new ArrayList<ArrayList<Integer>>();

int point = 0;
int tmp;
int select = -1;

void setup() {
  size(1600, 800);

  noStroke();
  //stroke(240, 240, 240);

  for (int i = 0; i<N; i++) {
    barA.add(N - i);
  }

  rectMode(RADIUS);
  background(#222222);

  bar.add(barA);
  bar.add(barB);
  bar.add(barC);

  drawBar();
  drawEn();
  drawPnt();
  
  solve(0,2,N);
}

void drawBar() {
  fill(200, 200, 200);
  rect(400, 500, 20, 300);
  rect(800, 500, 20, 300);
  rect(1200, 500, 20, 300);

  if (select != -1) {
    fill(100, 200, 200);
    rect(400+400*select, 500, 20, 300);
  }
}

void drawEn() {
  for (int j = 0; j<3; j++) {
    for (int i=0; i<bar.get(j).size(); i++) {
      tmp = bar.get(j).get(i);
      fill(400*tmp % 255, 200*tmp % 255, 300*tmp % 255);
      rect((j+1)*400.0, 800-(i+0.5)*500/N, (tmp+1)*180.0/N, 250.0/N);
    }
  }
}

void drawPnt() {
  point += 3;
  point = point % 3;
  fill(292, 35, 35);
  triangle(350+400*point, 50, 450+400*point, 50, 400+400*point, 150);
}

void keyPressed() {
  background(#222222);

  if (key == ' ') {
    if (select == -1) {
      select = point;
    } else if (select == point) {
      select = -1;
    } else {
      moveEn(select, point);
      select = -1;
    }
  } else if (keyCode == RIGHT) {
    point++;
  } else if (keyCode == LEFT) {
    point--;
  }

  drawPnt();
  drawBar();
  drawEn();
}

void moveEn(int from, int to) {

  if (bar.get(from).size() > 0) {
    int fromEn = bar.get(from).get(bar.get(from).size() - 1);
    if (bar.get(to).size() < 1) {
      bar.get(to).add(fromEn);
      bar.get(from).remove(bar.get(from).size() - 1);
    } else {


      int toEn = bar.get(to).get(bar.get(to).size() - 1);

      if (fromEn < toEn) {
        bar.get(to).add(fromEn);
        bar.get(from).remove(bar.get(from).size() - 1);
      }
    }
  }
}
void solve(int from ,int to ,int count){
  if(count == 1){
    println(from+"→"+to);
  }else{
    int z = 3-from-to;
    solve(from,z,count-1);
    println(from+"→"+to);
    solve(z,to,count-1);
  }
}
void draw() {
}
