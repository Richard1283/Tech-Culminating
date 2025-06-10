PFont myfont5;
void setup(){
  size(900,600);
}
void draw(){
  println(mouseX,",",mouseY);
  background(#000000);
  endScreenL();
}
void endScreenL(){
  fill(#FF0000);
  myfont5=createFont("Impact",200);
  textFont(myfont5);
  text("You lose!",80,379);
}
