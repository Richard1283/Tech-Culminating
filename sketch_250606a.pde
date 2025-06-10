int x = 5;
PFont myfont1;
PFont myfont2;
void setup(){
  size(900,600);
}
void draw(){
  if(mousePressed == true && mouseX <= 650 && mouseX >= 250 && mouseY >= 280 && mouseY <= 380){
    x++;
    println(x);
  }
  if(mousePressed == true && mouseX <= 650 && mouseX >= 250 && mouseY >= 400 && mouseY <= 500){
    x--;
  }
  if(x <= 0){
    x = 1;
  }
  background(#028CD3);
  menu();
  titleScreen();
}
void menu(){
  strokeWeight(x);
  stroke(128,0,0);
  fill(255,0,0);
  rect(250,400,400,100,20);
  stroke(0,128,33);
  fill(0,255,65);
  rect(250,280,400,100,20);
  fill(0,0,0);
  myfont2=createFont("Cooper Black",80);
  textFont(myfont2);
  text("Start",342.5,357);
  text("Quit",358.5,472);
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
