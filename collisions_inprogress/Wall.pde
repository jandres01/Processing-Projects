
class Wall {
  PVector p1, p2;
  
  Wall(PVector endPt1, PVector endPt2) {
    p1 = endPt1.copy();
    p2 = endPt2.copy();
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    line(p1.x,p1.y, p2.x,p2.y);
  }
  
  boolean intersect(Particle circ) {
    float dpx = p2.x - p1.x;
    float dpy = p2.y - p1.y;
    float a = dpx*dpx + dpy*dpy;
    float b = 2*(dpx*(p1.x - circ.pos.x) + dpy*(p1.y - circ.pos.y));
    float c = (p1.x - circ.pos.x)*(p1.x - circ.pos.x) +
              (p1.y - circ.pos.y)*(p1.y - circ.pos.y) -
              circ.r*circ.r;
    float disc = b*b - 4*a*c;
    return(disc >= 0);
  }
}