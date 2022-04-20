PImage bgImg; 
PImage soilImg; 
PImage lifeImg; 
PImage soldierImg; 
PImage groundhogIdleImg; 
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
    if (key == 'w') {
      y1 = y1 + 16;   
    } 
    else if (key == 's') {
      y1 = y1 + 16; 
    } 
    else if (key == 'd') {
      x1 = x1 + 16;  
    } 
    else if (key == 'a') {
       x1 = x1 - 16; 
    } 
  } 
  if(y1 < 0){
    y1 = 0;
  }
  else if(y1 > 640){
    y1 = 640;
  }
  else if(x1 < 80){
    x1 = 80;
  }
  else if(x1 > 480){
    x1 = 480;
  }
}

void keyPressed(){

}

void keyReleased(){
}
