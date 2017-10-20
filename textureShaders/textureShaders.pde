PShader shade;
PImage img;
TextureSphere ts;
float rot = 0;

/* Set the mode variable to change which shaer is used:
     0 = TEXTURE shader without lights
     1 = TEXLIGHT shader performing per-pixel diffuse/specular lighting
     2 = TEXLIGHT shader with black/white filter
     3 = TEXLIGHT shader with pixelation effect */
int mode = 1;

void setup() {
  size(500,500,P3D);
  noStroke();
  fill(255);
  img = loadImage("earth.jpg");
  ts = new TextureSphere(200,10,img);
  
  if(mode == 0) {
    shade = loadShader("texfrag.glsl", "texvert.glsl");
  } else if(mode == 1) {
    shade = loadShader("texlightfrag.glsl", "texlightvert.glsl");
  } else if(mode == 2) {
    shade = loadShader("tlbwfrag.glsl", "tlbwvert.glsl");
  } else if(mode == 3) {
    shade = loadShader("texlightbinfrag.glsl", "texlightbinvert.glsl");
  }
}

void draw() {
  shader(shade);
  background(0);
  if(mode == 3) {
    shade.set("scale",float(mouseY)/height*300);
  }
  if(mode != 0) {
    pointLight(255,255,255, mouseX,mouseY,400);
  }
  
  translate(width/2, height/2);
  rotateX(-PI/2);
  rotateZ(PI/2 + rot);
  ts.display();
}

void mouseDragged() {
  rot += float(mouseX - pmouseX)/width;
}