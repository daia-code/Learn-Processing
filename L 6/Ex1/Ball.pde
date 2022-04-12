class Ball {
  float x, y, speedX, speedY, diameter=20;

  Ball() {
    this.x=random(0, width);
    this.y=random(0, height);

    this.speedX=random(-4, 4);
    this.speedY=random(-4, 4);
  }
  void display() {
    ellipse(this.x, this.y, this.diameter, this.diameter);
  }
  void move() {
    this.x=this.x+this.speedX;
    this.y=this.y+this.speedY;

    if (this.x <0 || this.x>width) {
      this.speedX=this.speedX*-1;
    }
    if (this.y<0 || this.y>height) {
      this.speedY=this.speedY*-1;
    }
  }
}
