PImage groundhogDownImg; 
PImage groundhogLeftImg; 
PImage groundhogRightImg; 
PImage cabbageImg; 
int x = 0;
int x1 = 240;
int y1 = 80;
void setup() {
  size(640, 480, P2D);
  bgImg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  lifeImg = loadImage("img/life.png");
  soldierImg = loadImage("img/soldier.png");
  groundhogIdleImg = loadImage("img/groundhogIdle.png");
  groundhogDownImg = loadImage("img/groundhogDown.png");
  groundhogLeftImg = loadImage("img/groundhogLeft.png");
  groundhogRightImg = loadImage("img/groundhogRight.png");
  cabbageImg = loadImage("img/cabbage.png");
}

void draw() {
  image(bgImg, 0, 0);
  image(soilImg,0, 160);
  image(lifeImg,10, 10);
  image(lifeImg,80,10);
  image(soldierImg, x, 400);
  image(cabbageImg,240,240);
   
  stroke(124, 204, 25);
  line(0, 160, 640, 160);
  strokeWeight(15);
  image(groundhogIdleImg,x1,y1);
  
  
  fill(255, 255, 0);
  stroke(255, 255, 0);
  strokeWeight(5);
  ellipse(590, 50, 120, 120);//640,480
  
  fill(253, 184, 19);
  ellipse(590,50, 120, 120);
  
  strokeWeight(10.0);
  strokeCap(ROUND);
  stroke(255,0,0);
  
  x = x+2;
  if ( x > 640){
    x = -80;
  }
  if (keyPressed) {
    if (keyCode == UP) {
      x1 = x1 + 80;    
    } 
    else if (keyCode == DOWN) {
      x1 = x1 - 80;  
    } 
    else if (keyCode == RIGHT) {
      y1 = y1 + 80;  
    } 
    else if (keyCode == LEFT) {
       y1 = y1 - 80; 
    } 
  }   
  
}

void keyPressed(){
  //if (key == CODED) {
  //  if (keyCode == UP) {
  //    x1 = x1 + 80;    
  //  } 
  //  else if (keyCode == DOWN) {
  //    x1 = x1 - 80;  
  //  } 
  //  else if (keyCode == RIGHT) {
  //    y1 = y1 + 80;  
  //  } 
  //  else if (keyCode == LEFT) {
  //     y1 = y1 - 80; 
  //  } 
  //} 
  
}

void keyReleased(){
}
