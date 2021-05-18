//電子
class ele {
  PVector r;//位置ベクトル
  PVector v;//速度ベクトル
  float m;//質量
  float q;//電荷

  ele(float rx, float ry, float vx, float vy, float m, float q) {
    this.r = new PVector(rx, ry);
    this.v = new PVector(vx, vy);
    this.m = m;
    this.q = q;
  }

  public void show() {
    point(r.x, r.y,0);
  }

  public void move() {
    PVector dr = v.copy().mult(1./frameRate);
    r.add(dr);
  }

  public void force(PVector f) {
    PVector dv = f.copy().mult(1./(frameRate*m));
    v.add(dv);
  }
  
}
