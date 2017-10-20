float rot=0;
float joint1 = 0;
float joint2 = 0;
float arm1 = 0;
float arm2 = 0;
float joint3 = 0;

float nextDraw = 50;

void setup() {
 size(700,700,P3D);
 background(0);
}

void draw() {
  background(0);
  stroke(255);
  lights();
  fill(255);
  translate(width/2,height/2);
  
  pushMatrix();
  
  rotateZ(joint1);
  sphere(30);
  //pushMatrix();
  translate(nextDraw,0);
  rotateX(arm1);
  box(80,20,20); 

  pushMatrix();

  //pushMatrix();
  translate(nextDraw,0);
  rotateZ(joint2);
  sphere(30);
  //pushMatrix();
  translate(nextDraw,0);
  rotateX(arm2);
  box(80,20,20); 

  pushMatrix();

  //pushMatrix();
  translate(nextDraw,0);
  rotateZ(joint3);
  sphere(30);
  //pushMatrix();
  translate(nextDraw,0);
  box(80,20,20);
  
  
  popMatrix();
  popMatrix();
  popMatrix();
  //popMatrix();
  //popMatrix();
}

void keyPressed() {
 if(key == 'q' || key =='Q') joint1=joint1+0.05;
 if(key == 'w' || key =='W') joint1=joint1-0.05;
 if(key == 't' || key =='T') joint2=joint2+0.05;
 if(key == 'y' || key =='Y') joint2=joint2-0.05;
 if(key == 'o' || key =='O') joint3=joint3+0.05;
 if(key == 'p' || key =='P') joint3=joint3-0.05;
 
 if(key == 'a' || key =='A') arm1=arm1+0.05;
 if(key == 's' || key =='S') arm1=arm1-0.05;
 if(key == 'g' || key =='G') arm2+=0.05;
 if(key == 'h' || key =='H') arm2-=0.05;

}

//translate into the next joint