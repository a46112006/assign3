//You should implement your assign3 here.
final int GAME_TEAM1 = 1;
final int GAME_TEAM2 = 2;
final int GAME_TEAM3 = 3;
float speed = 5;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

PImage bg1Ing;
PImage bg2Ing;
PImage fighterIng;
PImage hpIng;
PImage treasureIng;
PImage enemyIng;
PImage end1Ing;
PImage end2Ing;
PImage start1Ing;
PImage start2Ing;
PImage enemy1Ing;
PImage gainbombIng;

int t1;//treasure position
int t2;//treasure position
int hp;
int f1;//fighter position
int f2;//fighter position
int bg1;//background1
int bg2;//background2
int gameState;
int team1speed, team2speed, team3speed;
int team1Y, team2Y, team3Y;//team Y position

void setup () {
  size(640, 480) ;  
  start1Ing = loadImage("img/start1.png");
  start2Ing = loadImage("img/start2.png");
  end1Ing = loadImage("img/end1.png");  
  end2Ing = loadImage("img/end2.png");
  bg1Ing = loadImage("img/bg1.png");
  bg2Ing = loadImage("img/bg2.png");
  fighterIng = loadImage("img/fighter.png");
  hpIng = loadImage("img/hp.png");
  treasureIng = loadImage("img/treasure.png");
  enemyIng = loadImage("img/enemy.png");
  t1 = floor(random(531));
  t2 = floor(random(50,441));
  hp = 220;
  bg1 = 0;
  bg2 = 640;
  f1 = 580;
  f2 = 240;
  gameState = GAME_TEAM1;
  team1Y = floor(random(0,421));
  team2Y = floor(random(240,420));
  team3Y = floor(random(120,300));
}

void draw() {
image(bg1Ing,bg1-640,0);
image(bg2Ing,bg2-640,0);
image(fighterIng,f1,f2);
image(treasureIng,t1,t2);

    if (upPressed) {
      f2 -= speed;
    }
    if (downPressed) {
      f2 += speed;
    }
    if (leftPressed) {
      f1 -= speed;
    } 
    if (rightPressed) {
      f1 += speed;    
    }
    
    if(      (   (f1-t1)<10  &&  (f1-t1)>-40  )  &&  (  (f2-t2)<10  &&  (f2-t2)>-40  )      ){
      hp +=20;
      t1 = floor(random(531));
      t2 = floor(random(50,421));   
      if(hp>=220){
      hp = 220;
      }
    }
    
    bg1 += 1;
    bg2 += 1;
    bg1 %= 1280;
    bg2 %= 1280;
    if(f1>580){
    f1=580;
    }
    if(f1<10){
    f1=10;
    }
    if(f2>420){
    f2=420;
    }
    if(f2<10){
    f2=10;
    }
    
    
  switch(gameState){
    case GAME_TEAM1 :
    for(int team1=0; team1 <= 4; team1 ++){
      image(enemyIng, team1*60 + team1speed-240, team1Y);
      team1speed += 1;
    }
    if(team1speed >= 880){
      gameState = GAME_TEAM2;
      team2speed = 0;
      team2Y = floor(random(240,420));      
    }
    
    break;

    case GAME_TEAM2 :
    for(int team2=0; team2 <= 4; team2 ++){
      image(enemyIng, team2*60 + team2speed-240, team2Y-team2*60);
      team2speed += 1;
    }
    if(team2speed >= 880){
      gameState = GAME_TEAM3;
      team3speed = 0;
      team3Y = floor(random(120,300));      
    }    
    
    break;
    
    case GAME_TEAM3 :
    for(int team3=0; team3 <= 1; team3 ++){
      image(enemyIng, team3*60 + team3speed-240, team3Y + team3*60);
      image(enemyIng, team3*60 + team3speed-240, team3Y - team3*60);
      image(enemyIng, 120+team3*60 + team3speed-240, team3Y - team3*60 +120);
      image(enemyIng, 120+team3*60 + team3speed-240, team3Y + team3*60 -120);      
      image(enemyIng, 240 + team3speed-240, team3Y);
      team3speed += 2;
    }
    if(team3speed >= 880){
      gameState = GAME_TEAM1;
      team1speed = 0;
      team1Y = floor(random(0,421));
    }
    
    break;    

  }
rectMode(CORNERS);
rect(20,15,hp,35);
fill(#ff0000);
image(hpIng,15,15);  
}

void keyPressed(){
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
