PFont myfont6;
void setup(){
  size(900,600);
}
void draw(){
  println(mouseX,",",mouseY);
  background(#028CD3);
  goodbye();
}
void goodbye(){
  fill(255);
  myfont6=createFont("Impact",100);
  textFont(myfont6);
  text("Thanks for playing",75,290);
  text("our game :D",210,390);
}
