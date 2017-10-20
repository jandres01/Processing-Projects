String[] dream = new String [4];
String[] water = new String[6];
String[] stars = new String[4];
ArrayList<Integer> colors = new ArrayList<Integer>();
int fade,type=0;
int level = 2;
int curveX = 0;
int curveY = 0;
int starX,starY =0;
int tY, tX = 0;
color starC = color(255,210,161);

void setup() {
  size(800, 750);
  dream[2] = "LBF+F+F+F+F+F+F+F+F+F+F+F+F";   
  dream[3] = "BF-F++F-F-F-F++F-F++F-F++F-F-F-F++F-F-F-F-F";
  water[0] = "UTBCC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YCEOaA";
  water[1] = "UTBCC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YCEOaA";
  water[2] = "UTBCC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YCEOaA";
  water[3] = "UTBCC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YCEOaA";
  water[4] = "UTBCC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YC+-CxyC+-C+YCxzC+YCEOaA";
  stars[0] = "UxxxTRSOeUxxxyyTRSOeUxxxxyyyTRSOeUxxxxxxyyTRSOeUxxxxxyTRSOeUxxxxxxyyTRSOeUxxxxxxxxyyyTRSOeU+-xxxxxxxTRSOeEU+-xxxxxxxxyTRSOeE";
  colors.add(color(28, 107, 160));
  colors.add(color(28, 107, 160));
  colors.add(color(28, 107, 160));
}

void draw() {
  background(0);
  strokeWeight(3);
  println("click mouse and hit a key");
  stroke(255);
  //line(300,100,500,200);
  if(fade==1) {
    fill(0,2);
  //  rect(0,0,width,height/3);
    fill(starC);
    noStroke();
    ellipse(random(width),random(height/2),5,5);
    ellipse(random(width),random(height/2),4,4);
    noFill();
  }
  
  sky();
  ocean();
  scene();
  dreamCatcher();
}

void sky() {
  stroke(starC);
  for (int i =0; i<stars[0].length(); i++) {
    char c = stars[0].charAt(i);
    if (c=='T') translate(tX,tY);
    else if (c=='U') pushMatrix();
    else if (c=='O') popMatrix();
    else if (c=='S') star(starX, starY, 8, 20, 5);
    else if (c=='R') rotate(frameCount / 50.0);
    else if (c=='+') starX -= 50;
    else if (c=='-') starY -= 50;
    else if (c=='x') tX += 100;
    else if (c=='y') tY += 100;
    else if(c=='E') starX = starY = 0;
    else if (c=='e') tX = tY = 0;
  }
  stroke(255);
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void ocean() {
  if (type==0) passiveOcean();
  else activeOcean();
}

void passiveOcean() {
  strokeWeight(7);
  stroke(28, 107, 160);
  for (int j =0; j<5; j++) {  
    for (int i =0; i<water[j].length(); i++) {
      char c = water[j].charAt(i);
      if (c=='T') {
        switch(j) {
        case 0 :
          translate(0, 475);
          break;
        case 1:
          translate(0, 500);
          break;
        case 2:
          translate(0, 550);
          break;
        case 3:
          translate(0, 600);
          break;
        case 4:
          translate(0, 625);
          break;
        default :
          println("wtf");
          break;
        }
      } else if (c=='U') pushMatrix();
      else if (c=='O') popMatrix();
      else if (c=='E') endShape();
      else if (c=='B') beginShape();
      else if (c=='C') curveVertex(curveX, curveY);
      else if (c=='+') curveX = curveX + 20;
      else if (c=='-') curveY = curveY - 10;
      else if (c=='x') curveX = curveX + 30;
      else if (c=='y') curveY = curveY - 40;
      else if (c=='Y') curveY = curveY + 10;
      else if (c=='z') curveY = curveY + 40;
      else if (c=='a') curveX = 0;
      else if (c=='A') curveY = 0;
    }
  }

  strokeWeight(3);
}

void activeOcean() {
  blendMode(BLEND);
  blendMode(SCREEN);

  noFill();
  strokeWeight(20);
  for (int i = 0; i < 3; i++) {
    stroke(colors.get(i));
    beginShape();
    for (int w = -30; w < width + 30; w += 5) {
      int h = 2*(height / 3) +50;
      h += 100 * sin(w * 0.02 + frameCount * 0.07 + i * TWO_PI / 3) * pow(abs(sin(w * 0.001 + frameCount * 0.02)), 5);
      curveVertex(w, h);
    }    
    endShape();
  }
  for (int i = 0; i < 3; i++) {
    stroke(colors.get(i));
    beginShape();
    for (int w = -30; w < width + 30; w += 5) {
      int h = 2*(height / 3) -50;
      h += 100 * sin(w * 0.02 + frameCount * 0.07 + i * TWO_PI / 3) * pow(abs(sin(w * 0.001 + frameCount * 0.02)), 5);
      curveVertex(w, h);
    }    
    endShape();
  }
  strokeWeight(3);
  blendMode(NORMAL);
}

void scene() {
  stroke(244, 164, 96);
  fill(222, 184, 135);
  beginShape(QUADS);
  vertex(0, 0);
  vertex(250, 0);
  vertex(300, 75);
  vertex(0, 75);

  vertex(0, 750);
  vertex(75, 650);
  vertex(800, 650);
  vertex(800, 750);
  endShape();
  noFill();
}

void dreamCatcher() {
  pushMatrix();
  translate(width/6, height/4);

  for (int i =0; i<dream[level].length(); i++) {
    char c = dream[level].charAt(i);
    if (c=='F') f(height/pow(3, level));
    else if (c=='+') turnRight(PI/6);
    else if (c=='B') centerCircle(height/pow(3, level));
    else if (c=='L') line(0,-109,0,-89);
  }

  translate(0, height/6.3);
  for (int i =0; i<dream[3].length(); i++) {
    char c = dream[3].charAt(i);
    if (c=='F') f(height/pow(3, 3));
    else if (c=='-') turnLeft(PI/12);
    else if (c=='+') turnRight(PI/6);
    else if (c=='B') centerCircle(height/pow(3, 3));
    else if (c=='G') g(height/pow(3, 3));
  } 
  popMatrix();
}

void centerCircle(float len) {
  ellipseMode(CENTER);
  ellipse(0, 0, len*2+5, len*2+5);
}

void g(float len) {
  pushMatrix();
  translate(0, -len);
  noFill();
  ellipseMode(CORNERS);
  ellipse(0, 0, 30, -len);
  popMatrix();
}

void f(float len) {
  noFill();
  ellipseMode(CENTER);
  ellipse(0, 0, len/3, -len*2);
  //  translate(0, -len);
}

void turnLeft (float angle) {
  rotate(-angle);
}

void turnRight (float angle) {
  rotate(angle);
}

void keyPressed() {
  if (fade == 0) {
    fade = 1;
  } else {
    fade = 0;
  }
}
void mousePressed() {
  if (type == 0) {
    type = 1;
  } else {
    type = 0;
  }
}