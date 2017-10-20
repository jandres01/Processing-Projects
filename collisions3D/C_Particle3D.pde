class Particle3D {
  private PVector loc;
  private PVector vel;
  private PVector acc;
  
  public color fillCol = color(255);
  public float r = 5;

  public float mass = 1;

  Particle3D(PVector l, float rad) {
    this(l);
    r = rad;
  }
  Particle3D(PVector l) {
    acc = new PVector(0,0);
    vel = new PVector(random(-2,2),random(-2,2));
    loc = l.copy();
  }
  Particle3D() {
    this(new PVector(0,0));
  }

  void run(float t) {
    update(t);
    display();
  }
  void run() {
    run(1);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acc.add(f);
  }

  void update() {
    update(1);
  }

  // Method to update location
  void update(float t) {
    //println(PVector.mult(vel,t));
    vel.add(PVector.mult(acc,t));
    loc.add(PVector.mult(vel,t));
    acc.mult(0);
  }

  // Method to display
  void display() {
    noStroke();
    //fill(fillCol);
    pushMatrix();
    translate(loc.x,loc.y,loc.z);
    sphere(r);
    popMatrix();
  }

  boolean intersect(Particle3D other) {
    if(PVector.sub(other.loc,loc).magSq() < (r+other.r)*(r+other.r)) {
      return true;
    } else {
      return false;
    }
  }
  
  float getCollisionTime(Particle3D other) {
    PVector CD = PVector.sub(loc,other.loc);
    PVector Vcd = PVector.sub(vel,other.vel);
    float a = PVector.dot(Vcd,Vcd);
    float b = 2*PVector.dot(Vcd,CD);
    float c = PVector.dot(CD,CD) - (r+other.r)*(r+other.r);
    float disc = b*b - 4*a*c;
    float t1 = -1f;
    float t2 = -1f;
    if(disc >= 0) {
      t1 = (-b + sqrt(disc)) / (2*a);
      t2 = (-b - sqrt(disc)) / (2*a);
    }
    float retval = -1;
    if(t1 >= 0 && t2 >= 0) retval = min(t1,t2);
    else if(t1 >= 0) retval = t1;
    else if(t2 >= 0) retval = t2;
    return retval;
  }
  
  void performCollision(Particle3D other) {
    PVector k = PVector.sub(loc,other.loc).normalize();
    float z = PVector.mult(k,2).dot(PVector.sub(vel,other.vel));
    z = z / ((1/mass)+(1/other.mass));
    vel = PVector.sub(vel, PVector.mult(k, z/mass));
    other.vel = PVector.add(other.vel, PVector.mult(k, z/other.mass));
    
    loc.add(PVector.mult(vel,0.001));
    other.loc.add(PVector.mult(other.vel,0.001));
  }

  boolean intersect(Plane3D wall) {
    float d = PVector.sub(loc,wall.p[0]).dot(wall.n);
    return abs(d) <= r;
  }
  
  float getCollisionTime(Plane3D wall) {
    float numer = wall.p[0].dot(wall.n) - loc.dot(wall.n);
    float denom = vel.dot(wall.n);
    float t1 = (numer + r) / denom;
    float t2 = (numer - r) / denom;
    if(t1 < 0 && t2 < 0) return -1;
    else if(t1 >= 0 && t2 >= 0) {
      if(t1 < t2) return t1;
      else return t2;
    } else if(t1 >= 0) return t1;
    else return t2;
  }

  void performCollision(Plane3D wall) {
    vel = rotateAroundAxis(wall.n, PI, PVector.mult(vel,-1));
    loc.add(PVector.mult(vel,0.001));
  }

  PVector rotateAroundAxis(PVector axis, float theta, PVector vec) {
    PVector w = axis.get();
    w.normalize();
    PVector t = w.get();
    if (w.x == min(abs(w.x), abs(w.y), abs(w.z))) {
      t.x = 1;
    } else if (w.y == min(abs(w.x), abs(w.y), abs(w.z))) {
      t.y = 1;
    } else if (w.z == min(abs(w.x), abs(w.y), abs(w.z))) {
      t.z = 1;
    }
    PVector u = w.cross(t);
    u.normalize();
    PVector v = w.cross(u);
    
    PVector res = vec.get();
    res = new PVector(u.x*res.x + u.y*res.y + u.z*res.z,
                      v.x*res.x + v.y*res.y + v.z*res.z,
                      w.x*res.x + w.y*res.y + w.z*res.z);
    res = new PVector(cos(theta)*res.x + sin(theta)*res.y,
                      -sin(theta)*res.x + cos(theta)*res.y, res.z);
    res = new PVector(u.x*res.x + v.x*res.y + w.x*res.z,
                      u.y*res.x + v.y*res.y + w.y*res.z,
                      u.z*res.x + v.z*res.y + w.z*res.z);
    return res;
    /*
    res = new PVector(w.x*(w.x*vec.x + w.y*vec.y + w.z*vec.z)*(1 - cos(theta))
                         + vec.x*cos(theta) + (-w.z*vec.y + w.y*vec.z)*sin(theta),
                      w.y*(w.x*vec.x + w.y*vec.y + w.z*vec.z)*(1 - cos(theta))
                         + vec.y*cos(theta) + (w.z*vec.x - w.x*vec.z)*sin(theta),
                      w.z*(w.x*vec.x + w.y*vec.y + w.z*vec.z)*(1 - cos(theta))
                         + vec.z*cos(theta) + (-w.y*vec.x + w.x*vec.y)*sin(theta));
    return res; */
  }
}