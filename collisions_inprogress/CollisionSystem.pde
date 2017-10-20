
class CollisionSystem {
  ArrayList<Particle> parts;
  ArrayList<Wall> walls;
  
  CollisionSystem(int num, float rad) {
    parts = new ArrayList<Particle>();
    walls = new ArrayList<Wall>();
    for(int i=0; i<num; i++) {
      parts.add(new Particle(new PVector(random(rad,width-rad), random(rad,height-rad)), rad));
    }
  }
  
  void addWall(Wall w) {
    walls.add(w);
  }
  
  void run() {
    for(int i=0; i<parts.size(); i++) {
      Particle pi = parts.get(i);
      pi.fillCol = color(0);
      
      //Check for intersect with other particles
      for(int j=0; j<parts.size(); j++) {
        if(i != j) {
          Particle pj = parts.get(j);
          
          if(pi.intersect(pj)) {
            pi.fillCol = color(0,255,0);
            pj.fillCol = color(0,255,0);
            break;
          }
        }
      }
      
      //Check for intersect with walls
      for(int j=0; j<walls.size(); j++) {
        if(walls.get(j).intersect(pi)) {
          pi.fillCol = color(255,0,255);  
        }
      }
      
      parts.get(i).display();
    }
    for(int i = 0; i<walls.size(); i++) {
      walls.get(i).display();
    }
  }
  
}