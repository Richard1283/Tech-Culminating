int scene = 6;
int carSelect = -1;
IntList carX;
IntList carY;
IntList carHeight;
IntList carWidth;
boolean collision;

void setup() {
  size(900, 600);
}

void draw() {
  background(#0070FF);
  parkingGame();
}

void parkingGame() {
  stroke(0, 0, 0, 30);
  strokeWeight(3);
  noFill();
  square(180, 30, 540);
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 6; j++) {
      square(180 + 90*j, 30 + 90*i, 90);
    }
  }
  stroke(#0070FF);
  line(720, 213, 720, 297);
  if (carSelect == -1) {
    if (scene == 1) {
      carX = new IntList(270, 270, 450, -100, -100, -100, 315, 495, 675, -100, -100);
      carY = new IntList(255, 345, 525, -100, -100, -100, 480, 255, 255, -100, -100);
      carWidth = new IntList(180, 180, 180, 0, 0, 0, 90, 90, 90, 0, 0);
      carHeight = new IntList(90, 90, 90, 0, 0, 0, 180, 270, 270, 0, 0);
    } else if (scene == 2) {
      carX = new IntList(270, 450, -100, -100, -100, -100, 315, 675, 675, 495, -100);
      carY = new IntList(255, 435, -100, -100, -100, -100, 390, 210, 390, 165, -100);
      carWidth = new IntList(180, 180, 0, 0, 0, 0, 90, 90, 90, 90, 0);
      carHeight = new IntList(90, 90, 0, 0, 0, 0, 180, 180, 180, 270, 0);
    } else if (scene == 3) {
      carX = new IntList(360, 585, 495, -100, -100, -100, 405, 675, 225, 495, -100);
      carY = new IntList(255, 345, 525, -100, -100, -100, 390, 480, 165, 165, -100);
      carWidth = new IntList(180, 270, 270, 0, 0, 0, 90, 90, 90, 90, 0);
      carHeight = new IntList(90, 90, 90, 0, 0, 0, 180, 180, 270, 270, 0);
    } else if (scene == 4) {
      carX = new IntList(450, 540, 315, 0, 0, 0, 315, 405, 585, 585, -100);
      carY = new IntList(255, 435, 75, 0, 0, 0, 210, 390, 300, 120, -100);
      carWidth = new IntList(180, 180, 270, 0, 0, 0, 90, 90, 90, 90, -100);
      carHeight = new IntList(90, 90, 90, 0, 0, 0, 180, 180, 180, 180, -100);
    } else if (scene == 5) {
      
    } else if (scene == 6) {
      carX = new IntList(450, 270, 540, 315, -100, -100, 225, 405, 585, 585, 495);
      carY = new IntList(255, 75, 165, 435, -100, -100, 210, 120, 300, 480, 435);
      carWidth = new IntList(180, 180, 180, 270, 0, 0, 90, 90, 90, 90, 90);
      carHeight = new IntList(90, 90, 90, 90, 0, 0, 180, 180, 180, 180, 270);
    } else if (scene == 7) {
      carX = new IntList(540, 270, 360, 630, -100, -100, 405, 675, 495, 225, -100);
      carY = new IntList(255, 75, 435, 345, -100, -100, 165, 165, 435, 390, -100);
      carWidth = new IntList(180, 180, 180, 180, 0, 0, 90, 90, 90, 90, 0);
      carHeight = new IntList(90, 90, 90, 90, 0, 0, 270, 270, 270, 180, 0);
    } else if (scene == 8) {
      carX = new IntList(360, 585, 495, 360, -100, -100, 405, 675, 225, 495, -100);
      carY = new IntList(255, 345, 525, 75, -100, -100, 390, 480, 165, 165, -100);
      carWidth = new IntList(180, 270, 270, 180, 0, 0, 90, 90, 90, 90, -100);
      carHeight = new IntList(90, 90, 90, 90, 0, 0, 180, 180, 270, 270, -100);
    } else if (scene == 9) {
      carX = new IntList(270, 360, 540, 540, 585, 585, 225, 405, 405, 495, 675);
      carY = new IntList(255, 165, 345, 435, 75, 525, 120, 300, 480, 210, 345);
      carWidth = new IntList(180, 180, 180, 180, 270, 270, 90, 90, 90, 90, 90);
      carHeight = new IntList(90, 90, 90, 90, 90, 90, 180, 180, 180, 180, 270);
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

void car1() {
  pushMatrix();
  translate(carX.get(1), carY.get(1));
  if (scene == 1 || scene == 2 || scene == 4 || scene == 6 || scene == 7 || scene == 9) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 3 || scene == 8) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

void car2() {
  pushMatrix();
  translate(carX.get(2), carY.get(2));
  if (scene == 1 || scene == 6 || scene == 7 || scene == 9) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 3 || scene == 4 || scene == 8) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

void car3() {
  pushMatrix();
  translate(carX.get(3), carY.get(3));
  if (scene == 7 || scene == 8 || scene == 9) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 6) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

void car4() {
  pushMatrix();
  translate(carX.get(4), carY.get(4));
  if (scene == 9) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

void car5() {
  pushMatrix();
  translate(carX.get(5), carY.get(5));
  if (scene == 1) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 9) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

void car6() {
  pushMatrix();
  translate(carX.get(6), carY.get(6));
  rotate(radians(90));
  if (scene == 7) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  } else if (scene == 1 || scene == 2 || scene == 3 || scene == 4 || scene == 6 || scene == 8 || scene == 9) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  }
  popMatrix();
}

void car7() {
  pushMatrix();
  translate(carX.get(7), carY.get(7));
  rotate(radians(90));
  if (scene == 1 || scene == 7) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  } else if (scene == 2 || scene == 3 || scene == 4 || scene == 6 || scene == 8 || scene == 9) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  }
  popMatrix();
}

void car8() {
  pushMatrix();
  translate(carX.get(8), carY.get(8));
  rotate(radians(90));
  if (scene == 1 || scene == 3 || scene == 7 || scene == 8) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  } else if (scene == 2 || scene == 4 || scene == 6 || scene == 9) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  }
  popMatrix();
}

void car9() {
  pushMatrix();
  translate(carX.get(9), carY.get(9));
  rotate(radians(90));
  if (scene == 4 || scene == 6 || scene == 7 || scene == 9) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 2 || scene == 3 || scene == 8) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

void car10() {
  pushMatrix();
  translate(carX.get(10), carY.get(10));
  rotate(radians(90));
  if (scene == 0) {
    image(loadImage("can.png"), -90, -45, 180, 90);
  } else if (scene == 6 || scene == 9) {
    image(loadImage("plastic_bottle.png"), -135, -45, 270, 90);
  }
  popMatrix();
}

void mousePressed() {
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
  println(carSelect);
}

void keyPressed() {
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
  }
  if (keyCode == DOWN) {
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
  }
  if (keyCode == RIGHT) {
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
  }
  if (keyCode == UP) {
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
}
