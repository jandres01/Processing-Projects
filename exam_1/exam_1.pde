void setup() {
 background(0);
 size(600,600);
}

float x = 200;
float y = 200;

void draw() {
  stroke(0,255,0);
  strokeWeight(2);
  beginShape();
  fill(128);
  
  float off = map(mouseY, 0, height, 0, TWO_PI); //th+=TWO_PI/5) {
  for(float th= 0; th<TWO_PI; th+=TWO_PI/map(mouseX,0,width,3,15)) { //64 --> 10 ---> 5 shows number of steps
   //point(200*cos(th)+width/2,200*sin(th)+height/2);
   vertex(200*cos(th+off)+width/2,200*sin(th+off)+height/2);
  }
  endShape(CLOSE); //remove CLOSE 
  
  ////changing strokweight based on distance
  //stroke(255);
  //strokeWeight(3);
  //if(mousePressed) {
  //// line(width/2,height/2,mouseX,mouseY);
  //float d = sqrt(pow(pmouseX-mouseX,2)+pow(pmouseY -pmouseY,2)); //distance between 2
  //strokeWeight(constrain(map(d,0,10,5,20),5,20));
  // line(pmouseX,pmouseY,mouseX,mouseY);
  //}
  
  ////1st in class //different colors each corner
  //ellipseMode(CORNER);
  //for(float x =0; x<600; x+=20) {
  // for(float y = 0; y < 600; y += 20) {
  //   fill(x/600*255,y/600*255,0); //0 is black 
  //  ellipse(x,y,20,20); 
  // }
  //}
  
  ////2nd in class //ellipses drawing over each other
  //  background(0); //remove 
  //noStroke();
  //ellipse(x,y,100,100);
  //x+=0.5;
 
}