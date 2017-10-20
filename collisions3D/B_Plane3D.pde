class Plane3D {
  PVector[] p;
  PVector n;
  
  Plane3D (PVector[] verts) {
    p = verts;
    n = PVector.sub(p[1],p[0]).cross(PVector.sub(p[2],p[0]));
    n.normalize();
  }
  Plane3D (PVector a, PVector b, PVector c, PVector d) {
    p = new PVector[4];
    p[0]=a; p[1]=b; p[2]=c; p[3]=d; 
    n = PVector.sub(p[1],p[0]).cross(PVector.sub(p[2],p[0]));
    n.normalize();
  }
  
  void display() {
    stroke(128,128);
    strokeWeight(2);
    for(int i=0; i<p.length; i++) {
      if(i < p.length-1) {
        line(p[i].x,p[i].y,p[i].z, p[i+1].x,p[i+1].y,p[i+1].z);
      } else {
        line(p[i].x,p[i].y,p[i].z, p[0].x,p[0].y,p[0].z);
      }
    }
  }
  
}