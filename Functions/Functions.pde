void setup() {
  size(500,500);
}

float stepSz;

void draw() {
  background(0);
  stepSz = map(mouseY, 0,height, 0.0001,0.5);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(3);
  noFill();
  beginShape();
  for(float x=-1; x<1; x+=stepSz) {
    vertex(x*width/2, f(x)*height/2);
    //vertex(x*width/2, g(x)*height/2);
  }
  endShape();
}

float f(float x) {
  return sin(x*4*PI); 
}
float g(float x) {
  float factor = map(mouseX, 0,width, 0,20);
  return (1-4*x-pow(x*factor,3)) * sin(x*x*factor*factor) / 4000;
}