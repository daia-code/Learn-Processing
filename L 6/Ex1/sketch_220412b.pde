Ball[] bouncingBalls=new Ball[10];
void setup() {
  size(600, 300);
  fill(255);
  noStroke();
  for (int i=0; i<bouncingBalls.length; i++) {
    bouncingBalls[i]=new Ball();
  }
}
void draw() {
  background(0);
  for (Ball b : bouncingBalls) {
    b.display();
    b.move();
  }
}
