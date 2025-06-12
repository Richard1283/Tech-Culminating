int scene = -1; // decides which scene is being displayed
float titleCardY = 0; // y coordinate of the title (not in plan)
int fishingRodY = -350; // y coordinate of fishing rod
int fishingRodMovement = 5; // determines how the fishing rod moves (not in plan)
int signY = 0; // y coordinate of sign (not in plan)
int signYMov = 0; // determines how the sign moves (not in plan)
int carSelect = -1; // determines which car is being selected
IntList carX; // x coordinates of cars
IntList carY; // y coordinates of cars
IntList carHeight; // height of cars (not in plan)
IntList carWidth; // width of cars (not in plan)
boolean collision; // determines whether two cars have collided (not in plan)
int fishX; // x coordinate of first fish
int fishX2; // x coordinate of second fish
int fishX3; // x coordinate of third fish
int trashX; // x coordinate of first trash
int trashX2; // x coordinate of second trash
int trashX3; // x coordinate of third trash
int fishY; // y coordinate of first fish
int fishY2; // y coordinate of second fish
int fishY3; // y coordinate of third fish
int trashY; // y coordinate of first trash
int trashY2; // y coordinate of second trash (not in plan)
int trashY3; // y coordinate of third trash (not in plan)
int fishRebound=5; // speed of fish 1 (not in plan)
int fishRebound2=6; // speed of fish 2 (not in plan)
int fishRebound3=7; // speed of fish 3 (not in plan)
int trashRebound=6; // speed of trash 1 (not in plan)
int trashRebound2=6; // speed of trash 2 (not in plan)
int trashRebound3=6; // speed of trash 3 (not in plan)
int fishCaught; // how many fish have been caught (score)
int durability; // durability of fishing rod
int difficulty; // difficulty of game (not in plan)

void setup() {
  size(900, 600);
}
//mix of Richard, Kai, and Seth's work
void draw() {
  background(#299DE3);
  if (scene == -1) {
    if (fishingRodY > 330) {
      fishingRodMovement = -5;
      signYMov = -5;
    }
    if (fishingRodY == -185) {
      signYMov = 0;
    }
    if (signY == -520) {
      scene = 0;
    }
    fishingRodY += fishingRodMovement;
    signY += signYMov;
    background(#299DE3);
    rod();
    titleScreen();
    hook();
  } else if (scene == 0) {
    signY = -520;
    carSelect = -1;
    durability = 0;
    fishCaught = 0;
      if (mousePressed == true && mouseX <= 650 && mouseX >= 250 && mouseY >= 280 && mouseY <= 380) {
        scene = 1;
        delay(100);
      }
      if (mousePressed == true && mouseX <= 650 && mouseX >= 250 && mouseY >= 400 && mouseY <= 500) {
        scene = 17;
      }
      menu();
      titleScreen();
  } else if (scene == 1) {
    fishingRodY = 550;
    fishingRodMovement = 0;
    levelSelection();
    if (mousePressed == true && mouseX <= 505 && mouseX >= 305 && mouseY >= 340 && mouseY <= 380) {
      difficulty = 3;
    }
    if (mousePressed == true && mouseX <= 600 && mouseX >= 305 && mouseY >= 400 && mouseY <= 440) {
      difficulty = 2;
    }
    if (mousePressed == true && mouseX <= 500 && mouseX >= 305 && mouseY >= 460 && mouseY <= 500) {
      difficulty = 1;
    }
    if (keyPressed) {
      if (key == ENTER && difficulty != 0) {
        scene = 2;
      }
    }
  } else if (scene == 2) {
    gameInstructions();
    if (keyPressed) {
      if (key == 'm') {
        scene = 0;
      } else if (key == 'p') {
        scene = 3;
        key = 'a';
      }
    }
  } else if (scene == 3) {
    instructions1();
    if (keyPressed) {
      if (key == 'm') {
        scene = 0;
        fishingRodY = -100;
      } else if (key == 'p') {
        scene = 4;
      }
    }
  } else if (scene == 4) {
    fishGame();
    if (keyPressed) {
      if (key == 'i') {
        scene = 3;
      } else if (key == 'm') {
        scene = 0;
      }
    }
  } else if (scene == 5) {
    if (fishCaught == 1) {
      instructions2();
    } else if (fishCaught == 2 || fishCaught == 3) {
      scene = 6;
    }
    if (keyPressed) {
      if (key == 'm') {
        scene = 0;
      } else if (key == 'p') {
        scene = 6;
      }
    }
  } else if (scene == 6 || scene == 7 || scene == 8 || scene == 9 || scene == 10 || scene == 10 || scene == 11 || scene == 12 || scene == 13 || scene == 14) {
    parkingGame();
    if (keyPressed) {
      if (key == 'r') {
        carSelect = -1;
      } else if (key == 'i') {
        scene = 18;
        if (keyPressed) {
          if (key == 'm') {
            scene = 0;
          } else if (key == 'p') {
            scene = 6;
          }
        }
      }
    }
  } else if (scene == 15) {
    endScreenW();
  } else if (scene == 16) {
    endScreenL();
    delay(1000);
    scene = 17;
  } else if (scene == 17) {
    goodbye();
  } else if (scene == 18) {
    instructions2();
  }
}
//Kai
// draws the rod part of fishing rod (not in plan)
void rod() {
  stroke(0, 0, 0);
  noFill();
  strokeWeight(5);
  line(460, fishingRodY-325, 460, fishingRodY+305);
  arc(450, fishingRodY+305, 20, 20, radians(0), radians(90));
}

// draws the hook part of fishing rod (not in plan)
void hook() {
  noFill();
  arc(450, fishingRodY+305, 20, 20, radians(90), radians(180));
  line(440, fishingRodY+295, 440, fishingRodY+302);
  strokeWeight(1);
  fill(0, 0, 0);
  triangle(438, fishingRodY+295, 445, fishingRodY+295, 440, fishingRodY+285);
}

// draws the title screen animation
void titleScreen() {
  pushMatrix();
  translate(0, signY+205);
  image(loadImage("woodensign-removebg-preview.png"), 150, 415, 600, 120);
  fill(255, 255, 255);
  textFont(createFont("Brush Script MT", 110));
  text("Fishing Mania", 174, 500);
  text("Fishing Mania", 176, 500);
  text("Fishing Mania", 175, 501);
  text("Fishing Mania", 175, 499);
  fill(0, 0, 0);
  text("Fishing Mania", 175, 500);
  popMatrix();
}

// draws the menu
void menu() {
  strokeWeight(5);
  stroke(128, 0, 0);
  fill(255, 0, 0);
  rect(250, 400, 400, 100, 20);
  stroke(0, 128, 33);
  fill(0, 255, 65);
  rect(250, 280, 400, 100, 20);
  fill(0, 0, 0);
  textFont(createFont("Cooper Black", 80));
  text("Start", 342.5, 357);
  text("Quit", 358.5, 472);
}

// instructions for the game (not in plan)
void gameInstructions() {
  textFont(createFont("Times New Roman", 40));
  fill(255);
  text("In this game, you will be catching fish. Every\ntime you catch a fish, you must play a\nminigame to continue. Catch three fish to win.\nGood luck Player!", 84.5, 120);
  textFont(createFont("Times New Roman", 30));
  text("Press 'P' to play", 652, 540);
  text("Press 'M' to return to the menu", 60, 540);
}

// instructions for fish game
void instructions1() {
  textFont(createFont("Times New Roman", 40));
  fill(255);
  text("To fish, click the left mouse button, when \nclicked, the fishing rod will move toward the \ntop of the screen. Try and hit the fish as you \ngo up to get to the goal of 3 fish. Trash \ndecreases durability, and you have 10. If \ndurability hits 0, you lose. After catching a \nfish, you must play a minigame which will be \nexplained later in the game to continue.\n", 84.5, 120);
  textFont(createFont("Times New Roman", 30));
  text("Press 'P' to play", 652, 540);
  text("Press 'M' to return to the menu", 60, 540);
}

// instructions for parking game
void instructions2() {
  fill(255);
  textFont(createFont("Times New Roman", 40));
  text("The goal is to slide the fish through the exit\nopening in the edge of the grid. To play, \nshift the fish and the garbage up and down or \nleft and right, until the path is cleared to slide \nthe fish out the exit. You can only move \nforwards and backwards, not sideways. To \nmove an object, you must click on it then use \nthe arrow keys to move it up and down or left \nand right.", 87, 90);
  textFont(createFont("Times New Roman", 30));
  text("Press 'P' to play", 652, 540);
  text("Press 'M' to return to the menu", 60, 540);
}

// selection of difficulty of game (not in plan)
void levelSelection() {
  titleScreen();
  pushMatrix();
  translate(0, 40);
  fill(255);
  stroke(0);
  textFont(createFont("Cooper Black", 60));
  text("Please select a difficulty", 83.5, 280);
  text("Hard", 355, 340);
  text("Medium", 355, 400);
  text("Easy", 355, 460);
  fill(#299DE3);
  if (difficulty == 3) {
    fill(#00D31A);
  }
  rect(305, 300, 40, 40);
  fill(#299DE3);
  if (difficulty == 2) {
    fill(#00D31A);
  }
  rect(305, 360, 40, 40);
  fill(#299DE3);
  if (difficulty == 1) {
    fill(#00D31A);
  }
  rect(305, 420, 40, 40);
  popMatrix();
  fill(255);
  textFont(createFont("Times New Roman", 30));
  text("Press 'Enter' to continue", 550, 560);
}
//Seth
// runs the fish game
void fishGame() {
  background(#299DE3);
  fill(0);
  textSize(17);
  text("Fish Caught:", 5, 20);
  text(fishCaught, 95, 20);
  text("Durability:", 150, 20);
  stroke(0);
  strokeWeight(1);
  fill(#F22222);
  rect(251, 6, 100, 19);
  noStroke();
  fill(#14F22B);
  rect(251, 6, 100-durability, 19);
  fill(0);
  textFont(createFont("Times New Roman", 25));
  text("Press 'I' for instructions", 620, 570);
  text("Press 'M' to return to the menu", 60, 570);
  
  //moving fishing rod up and down
  if (fishingRodY <= -30) {
    fishingRodMovement+=10;
  } else if (fishingRodY == 550) {
    fishingRodMovement = 0;
  }
  if (durability == 100) {
    scene = 16;
  }
  if (mousePressed) {
    if (fishingRodY==550) {
      fishingRodMovement=-10;
      if (durability<100) {
        durability += 10;
      }
    }
  }
  fishingRodY+=fishingRodMovement;
  fish();
  fish2();
  fish3();
  garbage();
  garbage2();
  garbage3();
  pushMatrix();
  translate(0, -300);
  rod();
  hook();
  popMatrix();
}

//my dad helped me with collision detection
// draws fish (not in plan)
void drawFish(int x, int y) {
  strokeWeight(1.5);
  fill(#DE8922);
  noStroke();
  ellipse(x+60, y+25, 100, 50);
  triangle(x, y+50, x+20, y+25, x, y+7);
  fill(0);
  ellipse(x+90, y+25, 10, 10);
}

// draws mirrored fish (not in plan)
void drawFish2(int x, int y) {
  strokeWeight(1.5);
  fill(#DE8922);
  noStroke();
  ellipse(x, y+25, 100, 50);
  triangle(x+60, y+50, x+40, y+25, x+60, y+7);
  fill(0);
  ellipse(x-30, y+25, 10, 10);
}

// code for fish 1
void fish() {
  if (fishY == 0) {
    fishY = round(random(212, 532));
    fishX = round(random(0, 1000));
  }
  int hookStartX = width/2-10;
  int hookStartY = fishingRodY-15;
  int hookEndX = width/2+10;
  int hookEndY = fishingRodY+15;

  int fishStartX = fishX;
  int fishStartY = fishY-50;
  int fishEndX = fishX+110;
  int fishEndY = fishY;
  boolean isCollided = hookEndX >= fishStartX && hookStartX <= fishEndX && hookEndY >= fishStartY && hookStartY <= fishEndY;
  if (isCollided == true && fishingRodMovement < 0) {
    fishCaught++;
    fishY=-200;
    scene = 5;
  }
  if (fishRebound == 5) {
    if (fishY != -200) {
      drawFish(fishStartX, fishStartY);
    }
  } else {
    if (fishY != -200) {
      drawFish2(fishStartX, fishStartY);
    }
  }
  //fish movement
  if (fishX<-200) {
    fishRebound = 5;
  } else if (fishX>1000) {
    fishRebound = -5;
  }
  fishX += fishRebound;
}

// code for fish 2 (not in plan)
void fish2() {
  if (fishY2 == 0) {
    fishY2 = round(random(70, 300));
    fishX2 = round(random(200, 1000));
  }
  int hookStartX = width/2-10;
  int hookStartY = fishingRodY-15;
  int hookEndX = width/2+10;
  int hookEndY = fishingRodY+15;

  int fishStartX2 = fishX2;
  int fishStartY2 = fishY2-50;
  int fishEndX2 = fishX2+110;
  int fishEndY2 = fishY2;
  boolean isCollided = hookEndX >= fishStartX2 && hookStartX <= fishEndX2 && hookEndY >= fishStartY2 && hookStartY <= fishEndY2;
  if (isCollided == true && fishingRodMovement < 0) {
    fishCaught++;
    fishY2=-200;
    scene = 5;
  }
  if (fishRebound2 == 6) {
    if (fishY2 != -200) {
      drawFish(fishStartX2, fishStartY2);
    }
  } else {
    if (fishY2 != -200) {
      drawFish2(fishStartX2, fishStartY2);
    }
  }
  //fish movement
  if (fishX2<-200) {
    fishRebound2 = 6;
  } else if (fishX2>1000) {
    fishRebound2 = -6;
  }
  fishX2 += fishRebound2;
}

// code for fish 3 (not in plan)
void fish3() {
  if (fishY3 == 0) {
    fishY3 = round(random(100, 400));
    fishX3 = round(random(0, 500));
  }
  int hookStartX = width/2-10;
  int hookStartY = fishingRodY-15;
  int hookEndX = width/2+10;
  int hookEndY = fishingRodY+15;

  int fishStartX3 = fishX3;
  int fishStartY3 = fishY3-50;
  int fishEndX3 = fishX3+110;
  int fishEndY3 = fishY3;
  boolean isCollided = hookEndX >= fishStartX3 && hookStartX <= fishEndX3 && hookEndY >= fishStartY3 && hookStartY <= fishEndY3;
  if (isCollided == true && fishingRodMovement < 0) {
    fishCaught++;
    fishY3=-200;
    scene = 5;
  }
  if (fishRebound3 == 7) {
    if (fishY3 != -200) {
      drawFish(fishStartX3, fishStartY3);
    }
  } else {
    if (fishY3 != -200) {
      drawFish2(fishStartX3, fishStartY3);
    }
  }
  //fish movement
  if (fishX3<-200) {
    fishRebound3 = 7;
  } else if (fishX3>1000) {
    fishRebound3 = -7;
  }
  fishX3 += fishRebound3;
}

// code for garbage 1
void garbage() {
  if (trashY == 0) {
    trashY = round(random(50, 500));
    trashX = round(random(10, 20))-200;
  }
  int hookStartX = width/2-10;
  int hookStartY = fishingRodY-15;
  int hookEndX = width/2+10;
  int hookEndY = fishingRodY+15;

  int trashStartX = trashX;
  int trashStartY = trashY-75;
  int trashEndX = trashX+150;
  int trashEndY = trashY;
  boolean isCollided = hookEndX >= trashStartX && hookStartX <= trashEndX && hookEndY >= trashStartY && hookStartY <= trashEndY;
  if (isCollided == true && fishingRodMovement < 0) {
    if (durability < 100) {
      durability+=10;
      fishingRodMovement = 10;
    }
    trashY=0;
  }
  image(loadImage("can.png"), trashStartX, trashStartY, 150, 75);
  //fish movement
  if (trashX<-200) {
    trashRebound = 6;
  } else if (trashX>900) {
    trashRebound = -6;
  }
  trashX += trashRebound;
}

// code for garbage 2 (not in plan)
void garbage2() {
  if (trashY2 == 0) {
    trashY2 = round(random(200, 500));
    trashX2 = round(random(100, 500))-700;
  }
  int hookStartX = width/2-10;
  int hookStartY = fishingRodY-15;
  int hookEndX = width/2+10;
  int hookEndY = fishingRodY+15;

  int trashStartX2 = trashX2;
  int trashStartY2 = trashY2-75;
  int trashEndX2 = trashX2+150;
  int trashEndY2 = trashY2;
  boolean isCollided = hookEndX >= trashStartX2 && hookStartX <= trashEndX2 && hookEndY >= trashStartY2 && hookStartY <= trashEndY2;
  if (isCollided == true && fishingRodMovement < 0) {
    if (durability < 100) {
      durability+=10;
      fishingRodMovement = 10;
    }
    trashY2=0;
  }
  image(loadImage("can.png"), trashStartX2, trashStartY2, 150, 75);
  //fish movement
  if (trashX2<-200) {
    trashRebound2 = 7;
  } else if (trashX2>900) {
    trashRebound2 = -7;
  }
  trashX2 += trashRebound2;
}

// code for garbage 3 (not in plan)
void garbage3() {
  if (trashY3 == 0) {
    trashY3 = round(random(200, 500));
    trashX3 = round(random(100, 500))-700;
  }
  int hookStartX = width/2-10;
  int hookStartY = fishingRodY-15;
  int hookEndX = width/2+10;
  int hookEndY = fishingRodY+15;

  int trashStartX3 = trashX3;
  int trashStartY3 = trashY3-75;
  int trashEndX3 = trashX3+150;
  int trashEndY3 = trashY3;
  boolean isCollided = hookEndX >= trashStartX3 && hookStartX <= trashEndX3 && hookEndY >= trashStartY3 && hookStartY <= trashEndY3;
  if (isCollided == true && fishingRodMovement < 0) {
    if (durability < 100) {
      durability+=10;
      fishingRodMovement = 10;
    }
    trashY3=0;
  }
  image(loadImage("can.png"), trashStartX3, trashStartY3, 150, 75);
  //fish movement
  if (trashX3<-200) {
    trashRebound3 = 6;
  } else if (trashX3>900) {
    trashRebound3 = -6;
  }
  trashX3 += trashRebound3;
}
//Richard
// runs parking game
void parkingGame() {
  if (difficulty == 3) {
    if (fishCaught == 1) {
      scene = 12;
    } else if (fishCaught == 2) {
      scene = 13;
    } else if (fishCaught == 3) {
      scene = 14;
    }
  } else if (difficulty == 2) {
    if (fishCaught == 1) {
      scene = 9;
    } else if (fishCaught == 2) {
      scene = 10;
    } else if (fishCaught == 3) {
      scene = 11;
    }
  } else if (difficulty == 1) {
    if (fishCaught == 1) {
      scene = 6;
    } else if (fishCaught == 2) {
      scene = 7;
    } else if (fishCaught == 3) {
      scene = 8;
    }
  }
  textFont(createFont("Times New Roman", 25));
  text("Press 'I' for\ninstructions", 740, 500);
  text("Press 'M' to\nreturn to\nthe menu", 30, 500);
  textFont(createFont("Roboto Medium", 30));
  pushMatrix();
  rotate(radians(90));
  fill(255, 0, 0);
  text("EXIT", 225, -730);
  popMatrix();
  stroke(0, 0, 0, 30);
  strokeWeight(3);
  noFill();
  square(180, 30, 540);
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 6; j++) {
      square(180 + 90*j, 30 + 90*i, 90);
    }
  }
  stroke(#299DE3);
  line(720, 213, 720, 297);
  if (carSelect == -1) {
    if (scene == 6) {
      carX = new IntList(270, 270, 450, -100, -100, -100, 315, 495, 675, -100, -100);
      carY = new IntList(255, 345, 525, -100, -100, -100, 480, 255, 255, -100, -100);
      carWidth = new IntList(180, 180, 180, 0, 0, 0, 90, 90, 90, 0, 0);
      carHeight = new IntList(90, 90, 90, 0, 0, 0, 180, 270, 270, 0, 0);
    } else if (scene == 7) {
      carX = new IntList(270, 450, -100, -100, -100, -100, 315, 675, 675, 495, -100);
      carY = new IntList(255, 435, -100, -100, -100, -100, 390, 210, 390, 165, -100);
      carWidth = new IntList(180, 180, 0, 0, 0, 0, 90, 90, 90, 90, 0);
      carHeight = new IntList(90, 90, 0, 0, 0, 0, 180, 180, 180, 270, 0);
    } else if (scene == 8) {
      carX = new IntList(360, 585, 495, -100, -100, -100, 405, 675, 225, 495, -100);
      carY = new IntList(255, 345, 525, -100, -100, -100, 390, 480, 165, 165, -100);
      carWidth = new IntList(180, 270, 270, 0, 0, 0, 90, 90, 90, 90, 0);
      carHeight = new IntList(90, 90, 90, 0, 0, 0, 180, 180, 270, 270, 0);
    } else if (scene == 9) {
      carX = new IntList(450, 540, 315, 0, 0, 0, 315, 405, 585, 585, -100);
      carY = new IntList(255, 435, 75, 0, 0, 0, 210, 390, 300, 120, -100);
      carWidth = new IntList(180, 180, 270, 0, 0, 0, 90, 90, 90, 90, -100);
      carHeight = new IntList(90, 90, 90, 0, 0, 0, 180, 180, 180, 180, -100);
    } else if (scene == 10) {
      carX = new IntList(360, 270, 450, -100, -100, -100, 315, 405, 495, 675, -100);
      carY = new IntList(255, 345, 525, -100, -100, -100, 480, 390, 255, 255, -100);
      carWidth = new IntList(180, 180, 180, 0, 0, 0, 90, 90, 90, 90, 0);
      carHeight = new IntList(90, 90, 90, 0, 0, 0, 180, 180, 270, 270, 0);
    } else if (scene == 11) {
      carX = new IntList(450, 270, 540, 315, -100, -100, 225, 405, 585, 585, 495);
      carY = new IntList(255, 75, 165, 435, -100, -100, 210, 120, 300, 480, 435);
      carWidth = new IntList(180, 180, 180, 270, 0, 0, 90, 90, 90, 90, 90);
      carHeight = new IntList(90, 90, 90, 90, 0, 0, 180, 180, 180, 180, 270);
    } else if (scene == 12) {
      carX = new IntList(540, 270, 360, 630, -100, -100, 405, 675, 495, 225, -100);
      carY = new IntList(255, 75, 435, 345, -100, -100, 165, 165, 435, 390, -100);
      carWidth = new IntList(180, 180, 180, 180, 0, 0, 90, 90, 90, 90, 0);
      carHeight = new IntList(90, 90, 90, 90, 0, 0, 270, 270, 270, 180, 0);
    } else if (scene == 13) {
      carX = new IntList(360, 585, 495, 360, -100, -100, 405, 675, 225, 495, -100);
      carY = new IntList(255, 345, 525, 75, -100, -100, 390, 480, 165, 165, -100);
      carWidth = new IntList(180, 270, 270, 180, 0, 0, 90, 90, 90, 90, -100);
      carHeight = new IntList(90, 90, 90, 90, 0, 0, 180, 180, 270, 270, -100);
    } else if (scene == 14) {
      carX = new IntList(270, 360, 540, 540, 585, 585, 225, 405, 405, 495, 675);
      carY = new IntList(255, 165, 345, 435, 75, 525, 120, 300, 480, 210, 345);
      carWidth = new IntList(180, 180, 180, 180, 270, 270, 90, 90, 90, 90, 90);
      carHeight = new IntList(90, 90, 90, 90, 90, 90, 180, 180, 180, 180, 270);
    } else if (scene == 20) {
      carX = new IntList(270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      carY = new IntList(255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      carWidth = new IntList(180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      carHeight = new IntList(90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }

  fishCar();
  car1();
  car2();
  car3();
  car4();
  car5();
  car6();
  car7();
  car8();
  car9();
  car10();
}

// draws the car that the player controls
void fishCar() {
  noStroke();
  fill(255, 150, 0);
  pushMatrix();
  translate(carX.get(0), carY.get(0));
  ellipse(10, 0, 140, 80);
  triangle(-80, -40, -80, 40, -20, 0);
  fill(0);
  ellipse(50, -10, 10, 10);
  popMatrix();
}

// draws car 1
void car1() {
  pushMatrix();
  translate(carX.get(1), carY.get(1));
  if (scene == 6 || scene == 7 || scene == 9 || scene == 10|| scene == 11 || scene == 12 || scene == 14) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 8 || scene == 13) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

// draws car 2
void car2() {
  pushMatrix();
  translate(carX.get(2), carY.get(2));
  if (scene == 6 || scene == 10|| scene == 11 || scene == 12 || scene == 14) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 8 || scene == 9 || scene == 13) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

// draws car 3
void car3() {
  pushMatrix();
  translate(carX.get(3), carY.get(3));
  if (scene == 12 || scene == 13 || scene == 14) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 11) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

// draws car 4
void car4() {
  pushMatrix();
  translate(carX.get(4), carY.get(4));
  if (scene == 14) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

// draws car 5
void car5() {
  pushMatrix();
  translate(carX.get(5), carY.get(5));
  if (scene == 3) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 14) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

// draws car 6
void car6() {
  pushMatrix();
  translate(carX.get(6), carY.get(6));
  rotate(radians(90));
  if (scene == 12) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  } else if (scene == 6 || scene == 7 || scene == 8 || scene == 9 || scene == 10|| scene == 11 || scene == 13 || scene == 14) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  }
  popMatrix();
}

// draws car 7
void car7() {
  pushMatrix();
  translate(carX.get(7), carY.get(7));
  rotate(radians(90));
  if (scene == 6 || scene == 12) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  } else if (scene == 7 || scene == 8 || scene == 9 || scene == 10|| scene == 11 || scene == 13 || scene == 14) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  }
  popMatrix();
}

// draws car 8
void car8() {
  pushMatrix();
  translate(carX.get(8), carY.get(8));
  rotate(radians(90));
  if (scene == 6 || scene == 8 || scene == 10 || scene == 12 || scene == 13) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  } else if (scene == 7 || scene == 9 || scene == 11 || scene == 14) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  }
  popMatrix();
}

// draws car 9
void car9() {
  pushMatrix();
  translate(carX.get(9), carY.get(9));
  rotate(radians(90));
  if (scene == 9 || scene == 11 || scene == 12 || scene == 14) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 7 || scene == 8 || scene == 10|| scene == 13) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

// draws car 10
void car10() {
  pushMatrix();
  translate(carX.get(10), carY.get(10));
  rotate(radians(90));
  if (scene == 11 || scene == 14) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

void mousePressed() {
  if (scene == 6 || scene == 7 || scene == 8 || scene == 9 || scene == 10 || scene == 11 || scene == 12 || scene == 13 || scene == 14) {
    if (abs(mouseX - carX.get(0)) < carWidth.get(0)/2 && abs(mouseY - carY.get(0)) < carHeight.get(0)/2) {
      carSelect = 1;
    } else if (abs(mouseX - carX.get(1)) < carWidth.get(1)/2 && abs(mouseY - carY.get(1)) < carHeight.get(1)/2) {
      carSelect = 2;
    } else if (abs(mouseX - carX.get(2)) < carWidth.get(2)/2 && abs(mouseY - carY.get(2)) < carHeight.get(2)/2) {
      carSelect = 3;
    } else if (abs(mouseX - carX.get(3)) < carWidth.get(3)/2 && abs(mouseY - carY.get(3)) < carHeight.get(3)/2) {
      carSelect = 4;
    } else if (abs(mouseX - carX.get(4)) < carWidth.get(4)/2 && abs(mouseY - carY.get(4)) < carHeight.get(4)/2) {
      carSelect = 5;
    } else if (abs(mouseX - carX.get(5)) < carWidth.get(5)/2 && abs(mouseY - carY.get(5)) < carHeight.get(5)/2) {
      carSelect = 6;
    } else if (abs(mouseX - carX.get(6)) < carWidth.get(6)/2 && abs(mouseY - carY.get(6)) < carHeight.get(6)/2) {
      carSelect = 7;
    } else if (abs(mouseX - carX.get(7)) < carWidth.get(7)/2 && abs(mouseY - carY.get(7)) < carHeight.get(7)/2) {
      carSelect = 8;
    } else if (abs(mouseX - carX.get(8)) < carWidth.get(8)/2 && abs(mouseY - carY.get(8)) < carHeight.get(8)/2) {
      carSelect = 9;
    } else if (abs(mouseX - carX.get(9)) < carWidth.get(9)/2 && abs(mouseY - carY.get(9)) < carHeight.get(9)/2) {
      carSelect = 10;
    } else if (abs(mouseX - carX.get(10)) < carWidth.get(10)/2 && abs(mouseY - carY.get(10)) < carHeight.get(10)/2) {
      carSelect = 11;
    } else {
      carSelect = 0;
    }
  }
}

void keyPressed() {
  if (scene == 6 || scene == 7 || scene == 8 || scene == 9 || scene == 10 || scene == 11 || scene == 12 || scene == 13 || scene == 14) {
    if (carX.get(0) < 630) {
      if (keyCode == LEFT) {
        for (int i = 0; i < 6; i++) {
          if (carSelect == i + 1 && carX.get(i) - carWidth.get(i)/2 > 180) {
            for (int j = 0; j < 11; j++) {
              if (abs(carX.get(i) - carX.get(j)) <= (carWidth.get(i) + carWidth.get(j))/2) {
                if (carX.get(i) - carX.get(j) > 0) {
                  if (abs(carY.get(i) - carY.get(j)) <= abs(carHeight.get(i) - carHeight.get(j))/2) {
                    collision = true;
                    break;
                  } else {
                    collision = false;
                  }
                }
              }
            }
            if (collision == false) {
              carX.add(i, -90);
            }
          }
        }
      } else if (keyCode == DOWN) {
        for (int i = 6; i < 11; i++) {
          if (carSelect == i + 1 && carY.get(i) + carHeight.get(i)/2 < 570) {
            for (int j = 0; j < 11; j++) {
              if (abs(carY.get(i) - carY.get(j)) <= (carHeight.get(i) + carHeight.get(j))/2) {
                if (carY.get(i) - carY.get(j) < 0) {
                  if (abs(carX.get(i) - carX.get(j)) <= abs(carWidth.get(i) - carWidth.get(j))/2) {
                    collision = true;
                    break;
                  } else {
                    collision = false;
                  }
                }
              }
            }
            if (collision == false) {
              carY.add(i, 90);
            }
          }
        }
      } else if (keyCode == RIGHT) {
        for (int i = 0; i < 6; i++) {
          if (carSelect == i + 1 && carX.get(i) + carWidth.get(i)/2 < 720) {
            for (int j = 0; j < 11; j++) {
              if (abs(carX.get(i) - carX.get(j)) <= (carWidth.get(i) + carWidth.get(j))/2) {
                if (carX.get(i) - carX.get(j) < 0) {
                  if (abs(carY.get(i) - carY.get(j)) <= abs(carHeight.get(i) - carHeight.get(j))/2) {
                    collision = true;
                    break;
                  } else {
                    collision = false;
                  }
                }
              }
            }
            if (collision == false) {
              carX.add(i, 90);
            }
          }
        }
      } else if (keyCode == UP) {
        for (int i = 6; i < 11; i++) {
          if (carSelect == i + 1 && carY.get(i) - carHeight.get(i)/2 > 30) {
            for (int j = 0; j < 11; j++) {
              if (abs(carY.get(i) - carY.get(j)) <= (carHeight.get(i) + carHeight.get(j))/2) {
                if (carY.get(i) - carY.get(j) > 0) {
                  if (abs(carX.get(i) - carX.get(j)) <= abs(carWidth.get(i) - carWidth.get(j))/2) {
                    collision = true;
                    break;
                  } else {
                    collision = false;
                  }
                }
              }
            }
            if (collision == false) {
              carY.add(i, -90);
            }
          }
        }
      }
    } else {
      if (keyPressed) {
        if (keyCode == RIGHT) {
          scene = 4;
          carSelect = -1;
          fishingRodY = 550;
          if (fishCaught == 3) {
            scene = 15;
          }
        }
      }
    }
  }
}
//Kai
void endScreenW() {
  fill(#FEFF00);
  textFont(createFont("Impact", 200));
  text("You win!", 110, 379);
}

void endScreenL() {
  fill(#FF0000);
  textFont(createFont("Impact", 200));
  text("You lose!", 80, 379);
}

void goodbye() {
  fill(255);
  textFont(createFont("Impact", 100));
  text("Thanks for playing", 75, 290);
  text("our game :D", 210, 390);
}
