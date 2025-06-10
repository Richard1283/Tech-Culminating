float titleCardY = 0;
int hookY = 0;
int hookYMov = 5;
int signY = 0;
int signYMov = 0;
PFont myfont1;
void setup(){
  size(900,600);
}
void draw(){
  if (hookY > 330) {
    hookYMov = -5;
    signYMov = -5;
  }
  if (hookY == -185) {
    signYMov = 0;
  }
  hookY += hookYMov;
  signY += signYMov;
  background(#028CD3);
  rod();
  titleScreen();
  hook();
}
void rod(){
  stroke(0,0,0);
  noFill();
  strokeWeight(5);
  line(450,hookY+(-330),450,hookY+300);
  arc(440,hookY+300,20,20,radians(0),radians(90));
}
void hook(){
  noFill();
  arc(440,hookY+300,20,20,radians(90),radians(180));
  line(430,hookY+290,430,hookY+300);
  strokeWeight(1);
  fill(0,0,0);
  triangle(428,hookY+290,435,hookY+290,430,hookY+280);
}
void titleScreen(){
  pushMatrix();
  translate(0,signY+205);
  image(loadImage("woodensign-removebg-preview.png"),150,415,600,120);
  fill(255,255,255);
  myfont1=createFont("Brush Script MT",110);
  textFont(myfont1);
  text("Fishing Mania",174,500);
  text("Fishing Mania",176,500);
  text("Fishing Mania",175,501);
  text("Fishing Mania",175,499);
  fill(0,0,0);
  text("Fishing Mania",175,500);
  popMatrix();
}
