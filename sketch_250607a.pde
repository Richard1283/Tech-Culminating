PFont myfont1;
PFont myfont2;
void setup(){
  size(900,600);
}
void draw(){
  println(mouseX,",",mouseY);
  background(#028CD3);
  instructions1();
  if (keyPressed) {
    if (key == 'm'){
      fill(0);
    }
    if (key == 'p'){
      fill(255);
    }
  }
}
void instructions1(){
  myfont1=createFont("Times New Roman",40);
  textFont(myfont1);
  text("        To fish, click the left mouse button, when \nclicked, the fishing rod will move toward the \ntop of the screen. Try and hit the fish as you \ngo up to get to the goal of 3 fish. Trash \ndecreases durability, and you have 10. If \ndurability hits 0, you lose. After catching a \nfish, you must play a minigame which will be \nexplained later in the game to continue.\n",84.5,120);
  myfont2=createFont("Times New Roman",30);
  textFont(myfont2);
  text("Press 'P' to play",652,540);
  text("Press 'M' to return to the menu",60,540);
}
