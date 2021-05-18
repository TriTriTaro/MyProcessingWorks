float theta;

void setup() {
  size(1600, 900);

  stroke(0);
  strokeWeight(0);
  colorMode(HSB);
}

void draw() {
  theta += 0.005;
  theta %= PI;

  background(250);

  bunkai(new PVector(750, 900), new PVector(850, 900), 10);
}

void bunkai(PVector r1, PVector r2, int fuka) {
  PVector r3 = r2.copy();
  PVector r4 = r2.copy();
  
  r3.sub(r1).rotate(-HALF_PI/2.0).mult(1.414213562).add(r1);
  r4.sub(r1).rotate(-HALF_PI).add(r1);
  fill(20*fuka, 230, 230);
  
  
  beginShape();
  vertex(r1.x,r1.y);
  vertex(r2.x,r2.y);
  vertex(r3.x,r3.y);
  vertex(r4.x,r4.y);
  endShape(CLOSE);
  

  if (fuka > 0) {
    
    r2.sub(r1).div(2.0);
    r2.add(r2.copy().rotate(-theta));

    bunkai(r4, r4.copy().add(r2), fuka-1);
    bunkai(r4.copy().add(r2), r3, fuka-1);
  }
}
/*
void rect2(PVector r1, PVector r2) {
  PVector r3 = r2.copy();
  r3.sub(r1).rotate(-HALF_PI/2.0).div(1.414213562);
  
  
  beginShape();
  vertex(r1.x,r1.y);
  r1.add(r2);
  vertex(r1.x,r1.y);
  
  vertex(r2.x,r2.y);
  endShape(CLOSE);
}
*/
