PImage img;

void setup() {
 size(400,300);
 background(230,40,40);
 img = loadImage("https://pbs.twimg.com/profile_images/660581372101177344/LP5Hbhms.jpg");
}
int center = 150;

void draw() {
  ellipse(185,150,270,260);
 image(img,195,115, 100,100);
 stroke(255,165,0);
 strokeWeight(10);
 fill(255,165,0);
 rect(90,80,120,20);
 rect(135,100,25,120);
 fill(0,0,0,0);
 line(177,195,177,120);
 line(239,220,239,120);
 arc(208,195, 60, 50, 0, PI); 
 
 strokeWeight(2);
 stroke(0);
 fill(0);
 rect(138,100,18,110);
 triangle(125,100,148,80,170,100);
 fill(255);
 
 stroke(255);
 ellipse(147,120,3,20);
 
 stroke(0,0,0,10);
 fill(255,255,255,10);
 strokeWeight(6);
 stroke(0,0,0,20);
 curve(30,30,85,170,180,250,200,200);
 curve(30,30,100,170,200,250,200,200);
 curve(30,30,115,170,220,250,200,200);
 curve(30,30,70,170,160,250,200,200);


}