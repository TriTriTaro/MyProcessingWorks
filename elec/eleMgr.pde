//電子の集まりを管理
class eleMgr {
  ArrayList<ele> eles = new ArrayList<ele>();

  public void addEle(float rx, float ry, float vx, float vy, float m, float q) {
    eles.add(new ele(rx, ry, vx, vy, m, q));
  }

  public void showAll() {
    for (ele e : eles) 
      e.show();
  }

  public void moveAll() {
    for (ele e : eles) 
      e.move();
  }

  public void forceAll() {
    for (int i=0; i<eles.size(); i++) {
      for (int j=i+1; j<eles.size(); j++) {
        ele ei = eles.get(i);
        ele ej = eles.get(j);

        PVector r_ij = ej.r.copy().sub(ei.r);

        float dist = r_ij.mag();

        PVector f_ij = r_ij.copy().normalize().mult((ei.q*ej.q)/(dist*dist));

        eles.get(j).force(f_ij);
        eles.get(i).force(f_ij.mult(-1));
      }
    }
  }

  public void net() {
    float[] posx, posy, posq;
    posx = new float[eles.size()];
    posy = new float[eles.size()];
    posq = new float[eles.size()];

    for (int i=0; i<eles.size(); i++) {
      posx[i] = eles.get(i).r.x;
      posy[i] = eles.get(i).r.y;
      posq[i] = eles.get(i).q;
    }

    for (float i=-50.0; i<50.0; i++) {
      for (float j=-50.0; j<50.0; j++) {
        float E = 0.0;

        for (int n=0; n<eles.size(); n++) {
          float d = dist(40*i, 40*j, posx[n], posy[n]);
          E += posq[n]/(d*d);
        }

        stroke((100*sqrt(abs(E))) % 250, 250, 250);
        point(40*i, 40*j, 800*E);
      }
    }
  }
}
