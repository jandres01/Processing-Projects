void setup() {
  size(500,500);
  background(255);
}

void draw(){
  strokeWeight(5);
  translate(width/2,height/2);
  float radius=100;
  int numPoints=80;
  float angle=TWO_PI/(float)numPoints;
  rotate(radians(30));
  for(int i=0;i<numPoints;i++) {
    float x = radius*sin(angle*i);
    float y = 2*radius*cos(angle*i);
    float r = 255;
    float b = 0;
    float incr = 255/(numPoints/2);
    print(r);
    beginShape();
    if(i<=(numPoints/2)) {
    stroke(r-i*incr,0,b+i*incr);
    }
    else stroke(b+(i-numPoints/2)*incr,0,r-(i-numPoints/2)*incr);
    point(x,y);
    endShape(CLOSE);
  }  
}