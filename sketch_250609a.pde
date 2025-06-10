PFont myfont3;
PFont myfont4;
void setup(){
  size(900,600);
}
void draw(){
  println(mouseX,",",mouseY);
  background(#028CD3);
  instructions2();
  if (keyPressed) {
    if (key == 'm'){
      background(0);
    }
    if (key == 'p'){
      background(255);
    }
  }
}
void instructions2(){
  myfont3=createFont("Times New Roman",40);
  textFont(myfont3);
  text("        The goal is to slide the fish through the \nexit opening in the edge of the grid. To play, \nshift the fish and the garbage up and down or \nleft and right, until the path is cleared to slide \nthe fish out the exit. You can only move \nforwards and backwards, not sideways. To \nmove an object, you must click on it then use \nthe arrow keys to move it up and down or left \nand right.",87,90);
  myfont4=createFont("Times New Roman",30);
  textFont(myfont4);
  text("Press 'P' to play",652,540);
  text("Press 'M' to return to the menu",60,540);
}
