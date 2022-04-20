PImage bgImg; 
PImage soilImg; 
PImage lifeImg; 
PImage soldierImg; 
PImage groundhogIdleImg; 
PImage cabbageImg; 
int x = 0;

void setup() {
  size(640, 480, P2D);
  bgImg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  lifeImg = loadImage("img/life.png");
  soldierImg = loadImage("img/soldier.png");
  groundhogIdleImg = loadImage("img/groundhogIdle.png");
  cabbageImg = loadImage("img/cabbage.png");
}

void draw() {
  image(bgImg, 0, 0);
  image(soilImg,0, 160);
  image(lifeImg,10, 10);
  image(lifeImg,80,10);
  image(soldierImg, 0, 400);
   
  stroke(124, 204, 25);
  line(0, 160, 640, 160);
  strokeWeight(15);
  image(groundhogIdleImg,240,80);
  
  
  fill(255, 255, 0);
  stroke(255, 255, 0);
  strokeWeight(5);
  ellipse(590, 50, 120, 120);//640,480
  
  fill(253, 184, 19);
  ellipse(590,50, 120, 120);
  
  strokeWeight(10.0);
  strokeCap(ROUND);
  stroke(255,0,0);
  
  
  if ( x > 640)
    x = -80;

void keyPressed(){
}
////////
void keyReleased(){
}
