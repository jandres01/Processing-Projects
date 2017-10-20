
PImage bg;
SoccerBall goldEarth;

PImage goldEarthTexture;
PImage[] imageTextures = new PImage[4]; 
float rotation = 0; 
float distance = 500;
Boolean mouse = false;

PVector hor =    new PVector(1,0,0);
PVector vert =   new PVector(0,1,0);
PVector oScreen = new PVector(0,0,1);

void setup() {
 size(800,720,P3D);
 bg = loadImage("worldcup.jpg");
 goldEarthTexture = loadImage("earth.jpg");

 imageTextures[0] = loadImage("Jabulani.jpg");
 imageTextures[1] = loadImage("worldcup1.png");
 imageTextures[2] = loadImage("world2.jpg");   
 imageTextures[3] = loadImage("euro12.jpg");   
 
 emissive(255,215,0);
 goldEarth = new SoccerBall(50,0,0,goldEarthTexture);
 emissive(0);
 goldEarth.spawnMoons(4,1); //lvl 0 & number of moons
 translate(width/2,height/2);
 pushMatrix();
}

void draw() {
  println("click, drag mouse");
  popMatrix(); 
  background(bg);
  pointLight(255,255,255,0,0,0);  //ammisive
  goldEarth.show();
  goldEarth.orbit();
  //fill(255);
  //line(mouseX, 20, pmouseX, 80); 
  //println(mouseX + " : " + pmouseX);
  pushMatrix();
}

void mouseDragged() {
  popMatrix();
  float x = (mouseX - pmouseX);
  float y = (mouseY - pmouseY);
  PVector m = (PVector.mult(hor,x)).add(PVector.mult(vert,y));
  PVector axis = m.cross(oScreen).normalize();
  float len = m.mag()/(width);
  rotateAroundWorld(axis,len);
  rotateAroundAxis(axis,-len,hor);
  rotateAroundAxis(axis,-len,vert);
  rotateAroundAxis(axis,-len,oScreen);
  pushMatrix();
}

void rotateAroundWorld(PVector axis, float theta) {
  PVector w = new PVector(axis.x, axis.y, axis.z);
  w.normalize();
  PVector t = new PVector(axis.x, axis.y, axis.z);
  if (abs(w.x) == min(abs(w.x), abs(w.y), abs(w.z))) {
    t.x = 1;
  } else if (abs(w.y) == min(abs(w.x), abs(w.y), abs(w.z))) {
    t.y = 1;
  } else if (abs(w.z) == min(abs(w.x), abs(w.y), abs(w.z))) {
    t.z = 1;
  }
  PVector u = w.cross(t);
  u.normalize();
  PVector v = w.cross(u);
  applyMatrix(u.x, v.x, w.x, 0, 
  u.y, v.y, w.y, 0, 
  u.z, v.z, w.z, 0, 
  0.0, 0.0, 0.0, 1);
  rotateZ(theta);
  applyMatrix(u.x, u.y, u.z, 0, 
  v.x, v.y, v.z, 0, 
  w.x, w.y, w.z, 0, 
  0.0, 0.0, 0.0, 1);
}

PVector rotateAroundAxis(PVector axis, float theta, PVector vec) {
  PVector w = axis.get();
  w.normalize();
  PVector t = w.get();
  if (w.x - min(abs(w.x), abs(w.y), abs(w.z)) < 0.001) {
    t.x = 1;
  } else if (w.y - min(abs(w.x), abs(w.y), abs(w.z)) < 0.001) {
    t.y = 1;
  } else if (w.z - min(abs(w.x), abs(w.y), abs(w.z)) < 0.001) {
    t.z = 1;
  } else {
    println("Minimum not found -- screw you floating point numbers");
  }
  PVector u = w.cross(t);
  u.normalize();
  PVector v = w.cross(u);
  PVector res = vec.get();
  res = new PVector(u.x*res.x + u.y*res.y + u.z*res.z,
                    v.x*res.x + v.y*res.y + v.z*res.z,
                    w.x*res.x + w.y*res.y + w.z*res.z);
  res = new PVector(cos(theta)*res.x + sin(theta)*res.y,
                    -sin(theta)*res.x + cos(theta)*res.y, res.z);
  res = new PVector(u.x*res.x + v.x*res.y + w.x*res.z,
                    u.y*res.x + v.y*res.y + w.y*res.z,
                    u.z*res.x + v.z*res.y + w.z*res.z);
  return res;
}