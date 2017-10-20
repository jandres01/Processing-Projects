TextureSphere ts;
float rot = 0, rotY=0;;
PImage img;


void setup() {
  size(500,500,P3D);
  img = loadImage("earth.jpg");
  ts = new TextureSphere(30, 30, img);

 // pushMatrix();
}

void draw() {
//  popMatrix();
  background(0);
  translate(width/2,height/2);
  float diff = mouseX - pmouseX;
  float diffY = mouseY - pmouseY;
  strokeWeight(10);
  stroke(255);
  
  noStroke();
  fill(255);
  rot += diff/width;
  rotY += diffY/width;
  scale(30);
  rotateX(PI/2+20);
  rotateX(rot);
  //rotateZ(rot);
  rotateY(rotY);
  ts.display();
    
//  popMatrix();
 // pushMatrix();
}