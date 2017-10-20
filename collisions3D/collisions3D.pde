/*
putting conditionals in Shaders
- run on GPU instead of CPU
- GPU shaders can't do loops & can't do conditionals! can do matrix!
- compiler unroll it and does loop 100 times if need to do 100 times
- GPU can't do while loops! Loops must have finite number of loops!
- GPU are dumb but we have a lot of them...

openGL in GLSL

*/

CollisionSystem3D cs;
ArrayList<Plane3D> walls = new ArrayList<Plane3D>();

void setup() {
  cs = new CollisionSystem3D(10);
  float sz = 200;
  walls.add(new Plane3D(new PVector(-sz,sz,sz),
                        new PVector(-sz,sz,-sz),
                        new PVector(sz,sz,-sz),
                        new PVector(sz,sz,sz)));
  walls.add(new Plane3D(new PVector(-sz,sz,sz),
                        new PVector(-sz,-sz,sz),
                        new PVector(-sz,-sz,-sz),
                        new PVector(-sz,sz,-sz)));
  walls.add(new Plane3D(new PVector(-sz,sz,-sz),
                        new PVector(-sz,-sz,-sz),
                        new PVector(sz,-sz,-sz),
                        new PVector(sz,sz,-sz)));
  walls.add(new Plane3D(new PVector(sz,sz,-sz),
                        new PVector(sz,-sz,-sz),
                        new PVector(sz,-sz,sz),
                        new PVector(sz,sz,sz)));
  walls.add(new Plane3D(new PVector(sz,sz,sz),
                        new PVector(sz,-sz,sz),
                        new PVector(-sz,-sz,sz),
                        new PVector(-sz,sz,sz)));
                       
  size(500,500,P3D);
}

void draw() {
  background(0);
  lights();
  
  translate(width/2,height/2);
  cs.applyForce(new PVector(0,0.1,0));
  //cs.run();
  //cs.runWithWallIntersections(walls);
  //cs.runShowingWallCollisions(walls);
  //cs.runWithWallCollisions(walls);
  cs.runWithParticleAndWallCollisions(walls);
  
  for(Plane3D wall : walls) {
    wall.display();
  }
}