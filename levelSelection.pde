PFont myfont1;
PFont myfont4;
PFont myfont6;
void setup(){
  size(900,600);
}
void draw(){
  println(mouseX,",",mouseY);
  background(#028CD3);
  titleScreen();
  levelSelection();
  if(mousePressed == true && mouseX <= 505 && mouseX >= 305 && mouseY >= 300 && mouseY <= 340){
    fill(#00FF41);
    rect(305,300,40,40);
  }
  if(mousePressed == true && mouseX <= 600 && mouseX >= 305 && mouseY >= 360 && mouseY <= 400){
    fill(#00FF41);
    rect(305,360,40,40);
  }
  if(mousePressed == true && mouseX <= 500 && mouseX >= 305 && mouseY >= 420 && mouseY <= 460){
    fill(#00FF41);
    rect(305,420,40,40);
  }
  if (keyPressed) {
    if (key == ENTER){
      background(0);
    }
  }
}
void levelSelection(){
  myfont6=createFont("Cooper Black",60);
  textFont(myfont6);
  text("Please select a difficulty",83.5,280);
  text("Hard",355,340);
  text("Medium",355,400);
  text("Easy",355,460);
  fill(#00D7FF);
  rect(305,300,40,40);
  rect(305,360,40,40);
  rect(305,420,40,40);
  fill(255);
  myfont4=createFont("Times New Roman",30);
  textFont(myfont4);
  text("Press 'Enter' to continue",550,540);
}
void titleScreen(){
  pushMatrix();
  translate(0,-315);
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
