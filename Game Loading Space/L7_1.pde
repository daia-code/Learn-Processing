PImage galaxy;
float posx, posy;
float speed=500;
float init=speed;

float vx, vy;

float gravity;

boolean moveLeft, moveRight, moveUp, moveDown;

float timelast = 0, timenow, timeelapsed;

void setup() {
  size(500, 500);
  galaxy = loadImage("space.jpg");
  galaxy.resize(500, 500);
  posx =int(random(width));
  posy =20;

  moveLeft = moveRight = moveUp= false;
  // initial velocity
  vx = vy = 10;
  // gravity
  gravity = 10;
  timelast = millis();
}

void table() {
  noFill();
  stroke(255);
  rect(20, 50, 170, 50);
  fill(255);
  textSize(20);
  text("Speed:", 40, 80);
  text(speed, 110, 80);
}
void draw() {

  noStroke();
  background(galaxy);
  table();
  fill(#FFF94B);
  rect(0, 470, width, 50);
  fill(#F01616);
  rect(200, 470, 100, 50);

  updateTime();
  userInput();
  moveShip();
  drawShip();
}


void updateTime() {

  timelast = timenow;
  timenow = millis();
  timeelapsed = timenow - timelast;
}

void drawShip() {

  fill(#FF5D5D);
  rect(posx, posy, 50, 25);

  fill(#F0F0F0);
  rect(posx+20, posy-10, 10, 10);

  fill(#952E05);
  rect(posx+20, posy+25, 10, 5);

  stroke(255, 255, 255);
  strokeWeight(2);
  line(posx+2, posy+25, posx+2, posy+40);

  stroke(255, 255, 255);
  strokeWeight(2);
  line(posx+48, posy+25, posx+48, posy+40);
  system();
}
void system() {
  if (posy + 70 <= height)
  {
    noStroke();
    fill(random(255), random(105), 0);
    ellipse(posx+30, posy+42, 10, 20);
    ellipse(posx+25, posy+42, 10, 20);
    ellipse(posx+20, posy+42, 10, 20);
  }
  if (posy+50>height) {

    fill(0);
    rect(100, 200, 300, 150);
    fill(#E00505);
    textSize(50);
    text("Game over", 140, 270);

    if (posx>206 && posx<262 && posy>450 && posy<500) {
      fill(#E00505);
      textSize(50);
      text("You win!", 140, 320);
    } else {
      textSize(50);
      text("You lose!", 140, 320);
    }
  }
}

void userInput() {

  if (moveLeft)
    vx -= 100 * timeelapsed / 1000;
  if (moveRight)
    vx += 100 * timeelapsed / 1000;
  if (moveUp)
    vy -= 100 * timeelapsed / 1000;
  if (moveDown)
    vy+=100 * timeelapsed/1000;
}

void moveShip() {

  vy += gravity * timeelapsed / 1000;

  posx += vx * timeelapsed / 1000;
  posy += vy * timeelapsed / 1000;


  // Detecting collisions
  if (posx + 50 >= width || posx <= 0)
    vx *= -1;
  if (posy - 25 <= 0)
    vy *= -1;
  if (posy + 50 >= height)
    vx=vy=0;
}

void keyPressed() {

  if (key==CODED) {
    switch (keyCode) {
    case UP:
      moveUp = true;
      speed=speed-50;
      break;
    case LEFT:
      moveLeft = true;
      break;
    case RIGHT:
      moveRight = true;
      break;
    case DOWN:
      moveDown = true;
      speed=speed+50;
      break;
    }
  }
}

void keyReleased() {

  if (key==CODED) {
    switch (keyCode) {
    case UP:
      moveUp = false;
      break;
    case LEFT:
      moveLeft = false;
      break;
    case RIGHT:
      moveRight = false;
      break;
    }
  }
}
