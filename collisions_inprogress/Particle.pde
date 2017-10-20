
class Particle {
  PVector pos, vel, acc;
  float r = 5;
  color fillCol = color(0);
  float mass = 1;
  
  Particle(PVector p, float rad) {
    pos = p.copy();
    r = rad;
    acc = new PVector(0,0);
    vel = new PVector(random(-2,2), random(-2,2));
  }
  
  void display() {
    /* NEEDS TO BE REAL PHYSICS */
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    sideBounce();
    
    fill(fillCol);
    noStroke();
    ellipse(pos.x,pos.y, r*2,r*2);
  }
  
  boolean intersect(Particle other) {
    float delX = pos.x - other.pos.x;
    float delY = pos.y - other.pos.y;
    float rsum = r + other.r;
    return(delX*delX + delY*delY <= rsum*rsum);
  }
  
  void sideBounce() {
    if(pos.x < r || pos.x > width-r) {
      vel.x *= -1; 
    }
    if(pos.y < r || pos.y > height-r) {
      vel.y *= -1;
    }
  }
  
}
  
  
  
  
  
  
  
  