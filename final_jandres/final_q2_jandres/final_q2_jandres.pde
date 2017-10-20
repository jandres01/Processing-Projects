
float dispAmt = 0;
float rot=0,rotY=0;

void setup() {
  size(600,600,P3D);
  smooth();
}

void draw() {
  background(100);
  translate(width/2,height/2);
  fill(0);
  noStroke();
  float diff = mouseX - pmouseX;
  rot += diff/ ((float)width-100);

  rotateX(rot*1.7);
  int nbr_circles = 300;
  float deviation = 5/8.0;
  
  float phi = (sqrt(5)+1)/2 - 1;            // golden ratio
  float golden_angle = phi * TWO_PI;        // golden angle
  float rad = width * .45;
  float area = sq(rad) * PI;
  float mean_area = area / 1000;//nbr_circles;
  float min_area = mean_area * (1-deviation);
  float max_area = mean_area * (1+deviation);
  float cum_area = 0;
  float fudge = .87; 
  float cx = 1;
  float cy = 1;
  for (int i = 1; i <= nbr_circles; ++i) {
    fill(i,255-i,i);
    float angle = i*golden_angle; 
    float ratio = i / (float) nbr_circles;
    float sm_area = min_area + ratio * (max_area - min_area);
    float sm_dia = 2 * sqrt( sm_area / PI );
    float adj_sm_dia = sm_dia * fudge;
  
    cum_area += sm_area;
    float spiral_rad = sqrt( cum_area / PI );
    float x = cx + cos(angle) * spiral_rad;
    float y = cy + sin(angle) * spiral_rad;
    pushMatrix();
    translate(x,y,-i*0.2);
    sphere(adj_sm_dia-6);
    popMatrix();
  }
}