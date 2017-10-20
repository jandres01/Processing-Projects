/*

Labertian Cosine Rule
- what is straight up and points up 
- amount of light that is going to be received by the surface

AmbientLight
- light that bounces off 
- light that is all around you
- not coming from specific direction

***process of "faking" smoothness is called Gouraud shading

Specifying our own per-vertex normals
- 

*/

void setup() {
 size(600,600,P3D);  
}

void draw() {
 background(0);
 
 //show near & far plane matter
 perspective(PI/3.0,1,1, width*2);
 
 //lights();
 ambientLight(50,0,0);
 pointLight(255,255,255,mouseX,mouseY,500);

 PVector a = new PVector(-100,0,-100);
 PVector aNorm = new PVector(1,0,0);
 PVector b = new PVector(0,100,-100);
  PVector bNorm = new PVector(0,1,0);
 PVector c = new PVector(100,0,-100);
 PVector cNorm = new PVector(-1,0,0);
 PVector d = new PVector(0,-100,-100);
 PVector dNorm = new PVector(0,-1,0);
 PVector e = new PVector(0,0,0);
 PVector eNorm = new PVector(0,0,-1);

 noStroke();
 fill(255);
 translate(200,200);
 beginShape(TRIANGLES);
 makeVertices(a,b,e);
 makeVertices(b,c,e);
 makeVertices(e,d,c);
 makeVertices(d,a,e);
 endShape();
 
 translate(200,200); 
 beginShape(TRIANGLES);
 makeVerticesNorm(a,b,e, aNorm, bNorm, eNorm);
 makeVerticesNorm(b,c,e, bNorm, cNorm, eNorm);
 makeVerticesNorm(c,d,e,  cNorm, dNorm, eNorm);
 makeVerticesNorm(d,a,e,  dNorm, aNorm, eNorm);
 endShape();
 
 sphereDetail(5);
 //sphere(150);
 
 /*
 noStroke();
 fill(255);
 translate(width/2,height/2);
 sphere(150);
 translate(-width/4,-height/4);
 sphere(75);
 translate(width/2,0);
 sphere(75);
 */
}
void makeVerticesNorm(PVector r, PVector s, PVector t,PVector rN, PVector sN, PVector tN) {
  normal(rN.x,rN.y,rN.z);
  vertex(r.x,r.y,r.z);
  normal(sN.x,sN.y,sN.z);
  vertex(s.x,s.y,s.z);
  normal(tN.x,tN.y,tN.z);
  vertex(t.x,t.y,t.z);
}

void makeVertices(PVector r, PVector s, PVector t) {
  PVector norm = PVector.sub(s,r);
  norm = norm.cross(PVector.sub(t,r));
  norm.normalize();
  normal(norm.x,norm.y,norm.z);
  
  vertex(r.x,r.y,r.z);
  vertex(s.x,s.y,s.z);
  vertex(t.x,t.y,t.z);

}