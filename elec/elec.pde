import peasy.*; //<>//

PeasyCam camera;

eleMgr pppp = new eleMgr();

void setup() { 
  size(800, 800, P3D);  
  camera = new PeasyCam(this, 5000);
  camera.setMinimumDistance(50);
  camera.setMaximumDistance(5000);

  colorMode(HSB);

  pppp.addEle(0, 0, 0, 0, 10000, -80000);
  pppp.addEle(250, 0, 0, 1000, 0.1, 400);

  fill(#4AFCC8);


}  
void draw() {
  background(50);

  stroke(#4AFCC8);
  strokeWeight(20);
  pppp.moveAll();
  pppp.showAll();
  pppp.forceAll();


  strokeWeight(3);
  pppp.net();
  
  //saveFrame("/frames/#####.tif");
}  
