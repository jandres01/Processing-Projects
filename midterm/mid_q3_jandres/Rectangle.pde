class Rectangle {   
  int iterations = 5;
  float xPos, yPos, rectWidth, rectHeight; 
 
  Rectangle(int rectDepth, float x, float y, float rectWidth_, float rectHeight_){
    xPos = x;
    yPos = y;
    rectWidth = rectWidth_;
    rectHeight = rectHeight_;
    fill(newColor());
    
    if(rectDepth < iterations ){
      rect(x,y,rectWidth,rectHeight);
      float num=int(random(1,5));  
      if (rectDepth % 2 == 0){
        new Rectangle(rectDepth+1,xPos,yPos,rectWidth/num,rectHeight);
        new Rectangle(rectDepth+1,xPos+(rectWidth/num),yPos,(rectWidth-(rectWidth/num)),rectHeight); 
      }
      else {    
        new Rectangle(rectDepth+1,xPos,yPos,rectWidth,(rectHeight/num));
        new Rectangle(rectDepth+1,xPos,yPos+(rectHeight/num),rectWidth,(rectHeight-(rectHeight/num)));
      }
    }
  }
  
  color BLUE    = color(0,128,255);
  color MAGENTA = color(69,227,255);
  color GREY    = color(192,192,192);
  color YELLOW  = color(255,255,153);
  color GREEN   = color(0,204,102);
  color MAROON  = color(204,0,0);
  color PURPLE  = color(178,102,255);
  color WHITE   = color(255);
  color BLACK   = color(0);
  
  color newColor(){
    float rand = random(1); 
    if (rand > 0 && rand< 0.1) return BLUE;
    else if (rand > 0.1 && rand < 0.2) return MAGENTA;
    else if (rand > 0.2 && rand < 0.3) return GREY;
    else if (rand > 0.3 && rand < 0.4) return GREEN;
    else if (rand > 0.4 && rand < 0.5) return YELLOW;
    else if (rand > 0.5 && rand < 0.6) return GREY; 
    else if (rand > 0.6 && rand > 0.7) return PURPLE;
    else if (rand > 0.6 && rand > 0.7) return MAROON;
    else if (rand > 0.7 && rand > 0.8) return BLACK; 
    else return WHITE;
  }
}