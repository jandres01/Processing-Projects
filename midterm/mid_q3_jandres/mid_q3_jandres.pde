void setup(){
  size(600,600);
  stroke(0);
  strokeWeight(5);
  new Rectangle(0,0,0,width,height);
}

void draw(){
//can't put anything in Draw or it will constantly be changing on its own.
}

void keyPressed(){
  background(255);
  new Rectangle(0,0,0,width,height);
}