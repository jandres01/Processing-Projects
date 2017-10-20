
/*
sketch that displays an animated, 3D particle system 
that uses a GLSL POINT shader to draw "billboarded" shapes 
or textures as the particles
*/

PShader pointShade;
float rot = 0;
float weight = 100;
float rX=0.7, rY, vX, vY;
float phi=(sqrt(5)+1)*0.5-1; // golden ratio
int p=300;                   //starting points
ArrayList<PVector> pts;
PImage img;

void setup() 
{ 
  size(600, 600, P3D);
  pts = new ArrayList<PVector>();
  pointShade = loadShader("ptfragbb.glsl","ptvertbb.glsl");
  smooth();
  strokeWeight(100);  
  stroke(0, 127);
  img = loadImage("cloud1.png");
  pointShade.set("weight", weight);
  pointShade.set("sprite",img);
}

void draw()
{ 
  background(128);
  shader(pointShade, POINTS);      
  pointShade.set("litPos",new PVector((mouseX-width/2)*3,(mouseY-height/2)*3,600));
  //fill(0);
  //text(p, 20,20);
  translate(width/2.0, height/2.0, 0);
  vX = 0.95 * vX + (mouseY-pmouseY)*1.6E-4;  
  rX += vX;  
  rotateX(rX);  
  vY = 0.95 * vY + (mouseX-pmouseX)*1.6E-4;  
  rY += vY;  
  rotateY(rY);  
  
  //translate(width/2,height/2);
  //rotateX(rot);
  //translate(-width/2,-height/2);
  if(p!=700) {
    if (!mousePressed) p += 1;
  }
 // strokeWeight(1+(2000.0+p)/p);
  for (int i = 1; i <= p; ++i)
  { 
    pushMatrix();
    rotateY((phi*i -floor(phi*i))*2.0*PI);
    rotateZ(asin(2*i/(float)p-1));
    stroke(0,0,phi*200,127);
    
    point(222.0, 0,0);
    popMatrix();
  }
  
  //println(int(frameRate "fps"));
  //if(mousePressed && mouseButton == LEFT) {
  //  if(keyPressed) {
  //    pts.add(new PVector(mouseX,mouseY, -200));
  //  } else {
  //    pts.add(new PVector(mouseX,mouseY,0));
  //  }
  //} 
  //for(PVector pt : pts) { point(pt.x,pt.y,pt.z); }
}

//void mouseDragged() {
//  if(mouseButton == RIGHT) {
//    rot += float(mouseY - pmouseY)/width;
//  }
//}