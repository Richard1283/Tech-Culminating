int fishingRodY=550;
int fishX;
int fishX2;
int fishX3;
int fishX4;
int trashX;
int trashX2;
int fishY;
int fishY2;
int fishY3;
int fishY4;
int trashY;
int trashY2;
int fishRebound=3;
int fishRebound2=3;
int fishRebound3=4;
int fishRebound4=2;
int trashRebound=3;
int trashRebound2=2;
int fishCaught;
int durability;
PImage trash;
int fishingRodMovement;  
void setup() {
  size(900,600);
  background(#299DE3);
}
void draw() {
  background();
  elementsUI();
  fish();
  fish2();
  fish3();
  fish4();
  garbage();
  garbage2();
  fishingRod();
}
void background() {
  noStroke();
  fill(#299DE3);
  rectMode(CORNER);
  rect(0,0,width,height);
}
void elementsUI() {
  fill(0);
  textSize(17);
  text("FishCaught:", 5,20);
  text(fishCaught, 95,20);
  text("Durability:",150,20);
  stroke(0);
  strokeWeight(1);
  fill(#F22222);
  rect(251,6,100,19);
  noStroke();
  fill(#14F22B);
  rect(251,6,100-durability,19);
}

void fishingRod() {
  //draw fishing rod
  stroke(0);
  strokeWeight(5);
  fill(255);
  line(width/2,-5,width/2,fishingRodY);
  ellipse(width/2,fishingRodY,50,50);

  //moving fishing rod up and down
  if (fishingRodY<=-31) {
    fishingRodY++;
    fishingRodMovement+=4;
  }
  if (!(mousePressed == true) && fishingRodY==550) {
    fishingRodMovement=0;
  }
  else if (mousePressed == true) {
    delay(100);
    if (fishingRodY>0) {
      fishingRodY-=2;
      if(durability<100) {
      durability += 10;
      }
    }
  }if (fishingRodY==548) {
    fishingRodMovement=-4;
  }
  fishingRodY+=fishingRodMovement;
}
//my dad helped me with collision detection
void drawFish(int x, int y) {
  strokeWeight(1.5);
      fill(#DE8922);
    noStroke();
    ellipse(x+60,y+25,100,50);
    triangle(x,y+50,x+20,y+25,x,y+7);
    fill(0);
    ellipse(x+90,y+25,10,10);
}
void drawFish2(int x, int y) {
    strokeWeight(1.5);
      fill(#DE8922);
    noStroke();
    ellipse(x,y+25,100,50);
    triangle(x+60,y+50,x+40,y+25,x+60,y+7);
    fill(0);
    ellipse(x-30,y+25,10,10);
}


void fish() {
  if (fishY == 0) {
    fishY = round(random(212,532));
    fishX = round(random(0,1000));
  }
  int hookStartX = width/2-28;
  int hookStartY = fishingRodY-28;
  int hookEndX = width/2+28;
  int hookEndY = fishingRodY+28;

  int fishStartX = fishX;
  int fishStartY = fishY-50;
  int fishEndX = fishX+110;
  int fishEndY = fishY;
  boolean isCollided = hookEndX >= fishStartX && hookStartX <= fishEndX && hookEndY >= fishStartY && hookStartY <= fishEndY;
  if(isCollided == true ){
    fishCaught++;
    fishY=-200;
  }
  if (fishRebound == 3) {
    drawFish(fishStartX,fishStartY);
  }else {
    drawFish2(fishStartX,fishStartY);
  }
    //fish movement
  if (fishX<-200) {
    fishRebound = 3;
  }
  else if (fishX>1000) {
    fishRebound = -3;
  }
    fishX += fishRebound;
}

void fish2() {
  if (fishY2 == 0) {
    fishY2 = round(random(70,300));
    fishX2 = round(random(200,1000));
  }
  int hookStartX = width/2-28;
  int hookStartY = fishingRodY-28;
  int hookEndX = width/2+28;
  int hookEndY = fishingRodY+28;

  int fishStartX2 = fishX2;
  int fishStartY2 = fishY2-50;
  int fishEndX2 = fishX2+110;
  int fishEndY2 = fishY2;
  boolean isCollided = hookEndX >= fishStartX2 && hookStartX <= fishEndX2 && hookEndY >= fishStartY2 && hookStartY <= fishEndY2;
  if(isCollided == true ){
    fishCaught++;
    fishY2=-200;
  }
  if (fishRebound2 == 3) {
    drawFish(fishStartX2,fishStartY2);
  }else {
    drawFish2(fishStartX2,fishStartY2);
  }
    //fish movement
  if (fishX2<-200) {
    fishRebound2 = 3;
  }
  else if (fishX2>1000) {
    fishRebound2 = -3;
  }
    fishX2 += fishRebound2;
}

void fish3() {
  if (fishY3 == 0) {
    fishY3 = round(random(100,400));
    fishX3 = round(random(0,500));
  }
  int hookStartX = width/2-28;
  int hookStartY = fishingRodY-28;
  int hookEndX = width/2+28;
  int hookEndY = fishingRodY+28;

  int fishStartX3 = fishX3;
  int fishStartY3 = fishY3-50;
  int fishEndX3 = fishX3+110;
  int fishEndY3 = fishY3;
  boolean isCollided = hookEndX >= fishStartX3 && hookStartX <= fishEndX3 && hookEndY >= fishStartY3 && hookStartY <= fishEndY3;
  if(isCollided == true ){
    fishCaught++;
    fishY3=-200;
  }
  if (fishRebound3 == 4) {
    drawFish(fishStartX3,fishStartY3);
  }else {
    drawFish2(fishStartX3,fishStartY3);
  }
    //fish movement
  if (fishX3<-200) {
    fishRebound3 = 4;
  }
  else if (fishX3>1000) {
    fishRebound3 = -4;
  }
    fishX3 += fishRebound3;
}


void fish4() {
  if (fishY4 == 0) {
    fishY4 = round(random(50,500));
    fishX4 = round(random(10,20));
  }
  int hookStartX = width/2-28;
  int hookStartY = fishingRodY-28;
  int hookEndX = width/2+28;
  int hookEndY = fishingRodY+28;

  int fishStartX4 = fishX4;
  int fishStartY4 = fishY4-50;
  int fishEndX4 = fishX4+110;
  int fishEndY4 = fishY4;
  boolean isCollided = hookEndX >= fishStartX4 && hookStartX <= fishEndX4 && hookEndY >= fishStartY4 && hookStartY <= fishEndY4;
  if(isCollided == true ){
    fishCaught++;
    fishY4=-200;
  }
  if (fishRebound4 == 2) {
    drawFish(fishStartX4,fishStartY4);
  }else{
    drawFish2(fishStartX4,fishStartY4);
  }
    //fish movement
  if (fishX4<-200) {
    fishRebound4 = 2;
  }
  else if (fishX4>1000) {
    fishRebound4 = -2;
  }
    fishX4 += fishRebound4;
}

void garbage() {
  if (trashY == 0) {
    trashY = round(random(50,500));
    trashX = round(random(10,20))-200;
  }
  int hookStartX = width/2-28;
  int hookStartY = fishingRodY-28;
  int hookEndX = width/2+28;
  int hookEndY = fishingRodY+28;

  int trashStartX = trashX;
  int trashStartY = trashY-75;
  int trashEndX = trashX+150;
  int trashEndY = trashY;
  boolean isCollided = hookEndX >= trashStartX && hookStartX <= trashEndX && hookEndY >= trashStartY && hookStartY <= trashEndY;
  if(isCollided == true ){
    if (durability < 100) {
    durability+=10;
    }
    trashY=0;
  }
  trash = loadImage("can.png");
  image(trash,trashStartX,trashStartY, 150, 75);
    //fish movement
  if (trashX<-200) {
    trashRebound = 3;
  }
  else if (trashX>900) {
    trashRebound = -3;
  }
    trashX += trashRebound;
}

void garbage2() {
  if (trashY2 == 0) {
    trashY2 = round(random(200,500));
    trashX2 = round(random(100,500))-700;
  }
  int hookStartX = width/2-28;
  int hookStartY = fishingRodY-28;
  int hookEndX = width/2+28;
  int hookEndY = fishingRodY+28;

  int trashStartX2 = trashX2;
  int trashStartY2 = trashY2-75;
  int trashEndX2 = trashX2+150;
  int trashEndY2 = trashY2;
  boolean isCollided = hookEndX >= trashStartX2 && hookStartX <= trashEndX2 && hookEndY >= trashStartY2 && hookStartY <= trashEndY2;
  if(isCollided == true ){
    if (durability < 100) {
    durability+=10;
    }
    trashY2=0;
  }
  image(trash,trashStartX2,trashStartY2, 150, 75);
    //fish movement
  if (trashX2<-200) {
    trashRebound2 = 2;
  }
  else if (trashX2>900) {
    trashRebound2 = -2;
  }
    trashX2 += trashRebound2;
}
