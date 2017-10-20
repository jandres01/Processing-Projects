class TextureSphere {
  int nSegs;
  float r;
  PImage img;
  
  TextureSphere(float radius, int numSegments, PImage texture) {
    nSegs = numSegments;
    r = radius;
    img = texture;
  }
  
  void display() {
    textureMode(NORMAL);
    beginShape(QUADS);
    texture(img);
    float uStep = PI/nSegs;
    float vStep = 2*PI/nSegs;
    //for(float u=0; u<2*PI-uStep; u+=uStep) {
    //  for(float v=-PI/2; v<PI/2-vStep; v+=vStep) {
    //    createVertex(u,v);
    //    createVertex(u+uStep,v);
    //    createVertex(u+uStep,v+vStep);
    //    createVertex(u,v+vStep);
    //  }
    //}
    for(float u=0; u<PI; u+=uStep) {
      for(float v=0; v<PI*2; v+=vStep) {
        createVertex(u,v);
        createVertex(u+uStep,v);
        createVertex(u+uStep,v+vStep);
        createVertex(u,v+vStep);
      }
    }
    endShape();
  }
  
  //taking x & y values
  void createVertex(float u, float v) {
    float x = pow((float)4/3,v)*pow(sin(u),2)*cos(v); //xpos(u,v);  //r*sin(u)*cos(v)
    float y = pow((float)4/3,v)*pow(sin(u),2)*sin(v);  //ypos(u,v);  //r*cos(u)*cos(v)
    float z = pow((float)4/3,v)*sin(u)*cos(u); //zpos(u,v);  //r*sin(v)
    //PVector norm = new PVector(x,y,z);
    //norm.normalize();
    //normal(-norm.x,-norm.y,-norm.z);
    //strokeWeight(1);
    //stroke(map(u,0,2*PI,0,255),map(v,-PI,PI,0,255),0);
    ////line(0,0,0, -100*norm.x, -100*norm.y, -100*norm.z);
    //noStroke();
    vertex(x,y,z, map(u, 0,PI, 0,1), map(v, 0,PI*2, 1,0));
  }
  
  float xpos(float u, float v) {
    return r * sin(u) * cos(v);
  }
  
  float ypos(float u, float v) {
    return r * cos(u) * cos(v);
  }
  
  float zpos(float u, float v) {
    return r * sin(v);
  }
}