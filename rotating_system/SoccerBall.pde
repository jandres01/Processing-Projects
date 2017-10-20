class SoccerBall { 
 float radius;
 float angle;
 float distance; //distance from sun
 float orbitspeed;
 PVector v;
 
 PShape globe;
 
 SoccerBall[] SoccerBalls;
 
 SoccerBall(float r, float d, float o,PImage img) {
  v = PVector.random3D();
  radius = r;
  distance = d;
  v.mult(distance); //scale by distance it should be
  angle = random(TWO_PI);
  orbitspeed = o;
  
  noStroke();
  noFill();
  globe = createShape(SPHERE, radius); // create PShape
  globe.setTexture(img);
 }
 
 void spawnMoons(int total, int level) {
   //number soccerballs to spawn!
   SoccerBalls = new SoccerBall[total];
   for(int i=0; i< SoccerBalls.length; i++) {
     float r = radius/(level*2);
     float d = random((radius + r),(radius+r)*3);
     float o = random(-0.03,0.03);
     int index = int(random(0,imageTextures.length));
     SoccerBalls[i] = new SoccerBall(r, d, o, imageTextures[index]);
     if(level < 2) {
       int num = int(random(0,3));
       SoccerBalls[i].spawnMoons(num, level+1);
     }
   }
 }
 
 void orbit() {
   angle = angle + orbitspeed;
   if(SoccerBalls != null) {
    for(int i=0; i< SoccerBalls.length; i++) {
     SoccerBalls[i].orbit();  //children SoccerBalls to orbit
    }
   }
 }
 
 void show() {
   pushMatrix();
   noStroke();
   fill(255);
   PVector v2 = new PVector(1,0,1);
   PVector p = v.cross(v2 );
   rotate(angle, p.x,p.y,p.z); 
   
   translate(v.x,v.y,v.z);
   shape(globe); //renders specific pshape 
   //sphere(radius); //immediate mode rendering  
   //pgeometry can store information about any pshape???

   if(SoccerBalls != null) {
    for(int i=0; i< SoccerBalls.length; i++) {
     SoccerBalls[i].show();
    }
   }
   popMatrix();
 }
 
}