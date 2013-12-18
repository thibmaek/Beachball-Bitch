PImage bg;
PFont display;
PImage start;
PImage info;
PImage overlay;
PImage folder;
PImage mountainball;
PShape beachball;
PShape[] crash = new PShape[5];
boolean pause = false;
float angle;
float size = 100;
float wx = random(size, width-size);
float wy = random(size, height-size);
float afstand = dist(mouseX, mouseY, wx, wy);
int score = 0;
int scene = 1;
int crashScreen = 1;
//IntList highscore;

void setup() {
  size(1024, 768);
  frame.setTitle("Beach Ball BITCH!");
//  highscore = new IntList();
  display = loadFont("MyriadPro-SemiCn-48.vlw");
  start = loadImage("startscreen.jpg");
  info = loadImage("info.jpg");
  bg = loadImage("bg.jpg");
  beachball = loadShape("beachball.svg");
  mountainball = loadImage("mountainball.png");
  overlay = loadImage("overlay.png");
  folder = loadImage("folder.png");
  crash[0] = loadShape("crash.svg");
  crash[1] = loadShape("crash1.svg");
  crash[2] = loadShape("crash2.svg");
  crash[3] = loadShape("crash3.svg");
  crash[4] = loadShape("crash4.svg");
  randomizer();
}

void draw() {
  switch(scene) {
  case 1:
    startscreen();
    break;
  case 2:
    info();
    break;
  case 3:
    level1();
    scoreCounter();
    if (score >=5) {
      level2();
    }
    else if (score >=40) {
      level3();
    }
    if (size == 0) {
      scene = 4;
    }
    break;
  case 4:
    gameover();
    break;
  }
}
/* -- Levels & Scenes -- */

void startscreen() {
  imageMode(CORNER);
  image(start, 0, 0);
}

void info() {
  imageMode(CORNER);
  image(info, 0, 0);
}

void level1() {
  if (size > 0) {
    imageMode(CORNER);
    image(bg, 0, 0);
    shapeMode(CENTER);
    pushMatrix();
    translate(wx, wy);
    rotate(angle);
    shape(beachball, 0, 0, size, size);
    angle += 0.1;
    popMatrix();
    size--;
    fill(0);
    textSize(15);
    text(score, width/2, 25);
  }
}

void level2() {
  if (size > 0) {
    imageMode(CORNER);
    image(bg, 0, 0);
    shapeMode(CENTER);
    pushMatrix();
    translate(wx, wy);
    rotate(angle);
    shape(beachball, 0, 0, size, size);
    angle += 0.1;
    popMatrix();
    size-=0.25;
    fill(0);
    textSize(15);
    text(score, width/2, 25);
  }
}

void level3() {
  if (size > 0) {
    imageMode(CORNER);
    image(bg, 0, 0);
    shapeMode(CENTER);
    pushMatrix();
    translate(wx, wy);
    rotate(angle);
    shape(beachball, 0, 0, size, size);
    angle += 0.1;
    popMatrix();
    size-=0.25;
    fill(0);
    textSize(15);
    text(score, width/2, 25);
  }
}

void gameover() {
//  highscore.append(score);
//  highscore.sort();
  background(255);
  shapeMode(CENTER);
  pushMatrix();
  translate(width/2, height/2);
  scale(2.0);
  shape(crash[crashScreen], 0, 0);
  popMatrix();
  fill(#4f74f3);
  textAlign(CENTER);
  textFont(display);
  text("Your total score was " + score, width/2, height/2+300);
}

/* -- Mechanismen & Generators -- */

void randomizer() {
  crashScreen = int(random(crash.length));
}

void keyPressed() {
  switch(key) {
  case 'p':
    pause = true;
    if (pause) {
      imageMode(CORNER);
      image(overlay, 0, 0);
    }
    noLoop();
    break;
  case 'r':
    pause = false;
    loop();
    circleGen();
    break;
  case 'a':
    scene = 2;
    break;
  case 'o':
    scene = 3;
    break;
  case 'e':
    scene = 3;
    break;
  case 'g':
    score = 0;
    scene = 1;
  }
}

void mouseClicked() {
  float afstand = dist(mouseX, mouseY, wx, wy);
  if (afstand<=size/2) {
    circleGen();
    score++;
  }
}

void circleGen() {
  size = 120; 
  wx = random(size, width-size);
  wy = random(size, height-size);
}

void scoreCounter() {
  imageMode(CENTER);
  switch(score) {
  case 1:
    image(folder, 950, 170);
    break;
  case 2:
    image(folder, 950, 170);
    image(folder, 950, 270);
    break;
  case 3:
    image(folder, 950, 170);
    image(folder, 950, 270);
    image(folder, 950, 370);
    break;
  case 4:
    image(folder, 950, 170);
    image(folder, 950, 270);
    image(folder, 950, 370);
    image(folder, 950, 470);
    break;
  case 5:
    image(folder, 950, 170);
    image(folder, 950, 270);
    image(folder, 950, 370);
    image(folder, 950, 470);
    image(folder, 950, 570);
    break;
  case 39:
    image(folder, 950, 170);
    image(folder, 950, 270);
    image(folder, 950, 370);
    image(folder, 950, 470);
    image(folder, 950, 570);
    break;
  }
}
