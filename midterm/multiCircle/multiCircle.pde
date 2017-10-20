int numCircles = 5;

void setup() {
  size(600,600);
  background(255);
  noFill();
}

void draw() { 
  float angle = PI/numCircles;
  ellipseMode(CENTER);
    translate(width/2,height/2);
  ellipse(0,0,width,height);
  drawCircle(0,0,width,height,angle);
}

void drawCircle(float x, float y, float circleWidth, float circleHeight, float angle){
  if(circleWidth>10){
      for(int i = 0; i<numCircles; i++) {
        float r = (circleWidth/2)*(sin(angle)) / (1+sin(angle));
        x = (circleWidth/2-r)*sin(2*angle*i);//angle of each smaller circle: sin(angle*i);
        y = (circleHeight/2-r)*cos(2*angle*i);
        pushMatrix();
        translate(x,y);
        ellipse(0,0,r*2,r*2);
        drawCircle(0,0,r*2,r*2,angle);
        popMatrix();
        
      }
     //  ellipse(0,0,50,50);
  }
  
}