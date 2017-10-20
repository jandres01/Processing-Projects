
CollisionSystem cs;

void setup() {
  size(800,800);
  cs = new CollisionSystem(500, 6);
  cs.addWall(new Wall(new PVector(0,0), new PVector(width,height)));
}

void draw() {
  background(255);
  cs.run();
}