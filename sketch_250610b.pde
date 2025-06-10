PFont myfont5;
void setup(){
  size(900,600);
}
void draw(){
  println(mouseX,",",mouseY);
  background(#028CD3);
  endScreenW();
}
void endScreenW(){
  fill(#FEFF00);
  myfont5=createFont("Impact",200);
  textFont(myfont5);
  text("You win!",110,379);
}
