PImage bgImg;
PImage titleImg;
PImage gameOverImg;
PImage startNormal;
PImage startHovered;
PImage restartNormal;
PImage restartHovered;
PImage soilImg;
PImage lifeImg;
PImage groundhogIdleIdle;
PImage groundhogIdleDownImg;
PImage groundhogIdleRight;
PImage groundhogIdleLeftImg;
PImage soldierImg;
PImage cabbageImg;
float soldierX,soldierY,hogIdleX,hogIdleY,cabX,cabY;
final int hogIdle_IDLE=0,hogIdle_DOWN=1,hogIdle_LEFT=2,hogIdle_RIGHT=3;
final int GAME_START=0,GAME_RUN=1,GAME_OVER=2;
final int BTN_WIDTH=144,BTN_HEIGHT=60;
final int BLOCK=80;
boolean cabStat;
int lifeCount,timer,gameStat,hogIdleStat;

void setup() {
  size(640, 480, P2D);

  //Load Images
  bgImg = loadImage("img/bg.jpg");//Background
  titleImg = loadImage("img/title.jpg");//titleimg
  gameOverImg = loadImage("img/gameover.jpg");//Gameover
  startNormal = loadImage("img/startNormal.png");//startNormal
  startHovered = loadImage("img/startHovered.png");//startHovered
  restartNormal = loadImage("img/restartNormal.png");//restartNormal
  restartHovered = loadImage("img/restartHovered.png");//restartHovered
  soilImg = loadImage("img/soil.png");//soil
  lifeImg = loadImage("img/life.png");//heart
  groundhogIdleIdle = loadImage("img/groundhogIdleIdle.png");//hogIdleIdle
  groundhogIdleDownImg = loadImage("img/groundhogIdleDown.png");//hogIdleIdle
  groundhogIdleLeftImg = loadImage("img/groundhogIdleLeft.png");//hogIdleIdle
  groundhogIdleRight = loadImage("img/groundhogIdleRight.png");//hogIdleIdle
  soldierImg = loadImage("img/soldier.png");//soldier
  cabbageImg = loadImage("img/cabbage.png");//cabbage
  
  gameStat=GAME_START;//set game stat
  
}

void draw() {
  // Switch Game State
  switch(gameStat){
    case GAME_START:// Game Start
      image(titleImg,0,0);//draw titlebg
      
      if(mouseX>248&&mouseX<248+BTN_WIDTH&&mouseY>360&&mouseY<360+BTN_HEIGHT){//if hovered
        image(startHovered,248,360);
      }else{
        image(startNormal,248,360);
      }
      
      break;
    case GAME_RUN:// Game Run

        image(bgImg,0,0);//Background        
        image(soilImg,0,160);//Soil
        noStroke();//Grass
        fill(124,204,25);//green
        rect(0,160,640,-15);//grass
        
        //Draw HP
        for(int i=0;i<lifeCount;i++)
        {
          image(lifeImg,10+i*70,10);
        }
        

        stroke(255,255,0);//sun outside color
        strokeWeight(5);//sun Weight to 5
        fill(253,184,19);//set Sun color
        ellipse(590,50,120,120);//Draw Sun
        
        //check timer
        if(timer==15){
          hogIdleStat=hogIdle_IDLE;
          if(hogIdleY%BLOCK<30){
            hogIdleY=hogIdleY-hogIdleY%BLOCK;
          }else{
            hogIdleY=hogIdleY-hogIdleY%BLOCK+BLOCK;
          }
          if(hogIdleX%BLOCK<30){
            hogIdleX=hogIdleX-hogIdleX%BLOCK;
          }else{
            hogIdleX=hogIdleX-hogIdleX%BLOCK+BLOCK;
          }
          println(hogIdleX);
          println(hogIdleY);
          timer=0;
        }
        
        //hogIdle
        switch(hogIdleStat){
          case hogIdle_IDLE:
            image(groundhogIdleIdle,hogIdleX,hogIdleY);
            break;
          case hogIdle_DOWN:
            image(groundhogIdleDownImg,hogIdleX,hogIdleY);
            timer+=1;
            hogIdleY+=80.0/15;
            break;
          case hogIdle_RIGHT:
            image(groundhogIdleRight,hogIdleX,hogIdleY);
            timer+=1;
            hogIdleX+=80.0/15;
            break;
          case hogIdle_LEFT:
            image(groundhogIdleLeftImg,hogIdleX,hogIdleY);
            timer+=1;
            hogIdleX-=80.0/15;
            break;
        }
        
        //check timer
        if(timer==15){
          hogIdleStat=hogIdle_IDLE;
          if(hogIdleY%BLOCK<30){//fix float point offset
            hogIdleY=hogIdleY-hogIdleY%BLOCK;
          }else{
            hogIdleY=hogIdleY-hogIdleY%BLOCK+BLOCK;
          }
          if(hogIdleX%BLOCK<30){
            hogIdleX=hogIdleX-hogIdleX%BLOCK;
          }else{
            hogIdleX=hogIdleX-hogIdleX%BLOCK+BLOCK;
          }

          timer=0;
        }
        

        //Soldier
        image(soldierImg,soldierX-80,soldierY);//Draw Soldier
        soldierX+=3;//Move Soldier
        soldierX%=720;
        
        //Cab
        if(cabStat){
          image(cabbageImg,cabX,cabY);
        
          //Cab collision detect
          if(hogIdleX<cabX+BLOCK&&hogIdleX+BLOCK>cabX&&hogIdleY<cabY+BLOCK&&hogIdleY+BLOCK>cabY){
            cabStat=false;
            lifeCount++;
          }
        }
        
        //soldier collision detect
        if(hogIdleX<soldierX-80+BLOCK&&hogIdleX+BLOCK>soldierX-80&&hogIdleY<soldierY+BLOCK&&hogIdleY+BLOCK>soldierY){
          lifeCount--;
          hogIdleStat=hogIdle_IDLE;
          
          //hogIdle pos
          hogIdleX=4*BLOCK;
          hogIdleY=BLOCK;
        }
        
        
        //game over
        if(lifeCount==0){
          gameStat=GAME_OVER;
        }
        
        break;
    case GAME_OVER:// Game Lose
      image(gameOverImg,0,0);//OVERbg
      
      if(mouseX>248&&mouseX<248+BTN_WIDTH&&mouseY>360&&mouseY<360+BTN_HEIGHT){//if hovered
        image(restartHovered,248,360);
      }else{
        image(restartNormal,248,360);
      }
      break;
  }
}

void keyPressed(){
  if(key ==CODED){
    switch(keyCode){
      case DOWN:
        if(hogIdleY+BLOCK<height&&hogIdleStat==hogIdle_IDLE){
          hogIdleStat=hogIdle_DOWN;
          timer=0;
        }
        break;
      case RIGHT:
        if(hogIdleX+BLOCK<width&&hogIdleStat==hogIdle_IDLE){
          hogIdleStat=hogIdle_RIGHT;
          timer=0;
        }
        break;
      case LEFT:
        if(hogIdleX>0&&hogIdleStat==hogIdle_IDLE){
          hogIdleStat=hogIdle_LEFT;
          timer=0;
        }
        break;
    }
  }
      
}

void keyReleased(){
}

void mouseClicked(){
  if(mouseX>248&&mouseX<248+BTN_WIDTH&&mouseY>360&&mouseY<360+BTN_HEIGHT&&(gameStat==GAME_START||gameStat==GAME_OVER)){//if hovered
    //soldier coordinate
    soldierX=0;
    soldierY=BLOCK*(int(random(4)+2));
    
    //Cabbage coordinate
    cabX=BLOCK*int(random(8));
    cabY=BLOCK*(int(random(4))+2);
    
    //Cabbage Stat
    cabStat=true;
    
    //Life count
    lifeCount=2;
    
    //hogIdle pos
    hogIdleX=4*BLOCK;
    hogIdleY=BLOCK;
    
    //hogIdle stat
    hogIdleStat=hogIdle_IDLE;
    
    //START GAME
    gameStat=GAME_RUN;
  }
}
