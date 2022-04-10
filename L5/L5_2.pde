void setup() {

  size(500, 300);
  background(0);
}
void draw() {
  float a = 0.0;
  float inc = TWO_PI/25.0;
  float prev_x = 0, prev_y = TWO_PI, x, y, x2, y2;
  for (int i=0; i<width; i=i+4) {
    x = i;
    y = 100+sin(a) * 40.0;
    x2=i;
    y2=100+cos(a)*40.0;
    stroke(255, 0, 0);
    line(prev_x, prev_y, x, y);
    stroke(0, 0, 255);
    line(prev_x, prev_y, x2, y2);
    prev_x = x;
    prev_y = y;
    a = a + inc;
  }
  writeWave();
}

void writeWave() {
  fill(255, 0, 0);
  stroke(255, 0, 0);
  line(100, 100, 100, 50);
  textSize(20);
  text("Sin wave", 90, 50);
  fill(0, 0, 255);
  stroke(0, 0, 255);
  line(220, 120, 220, 50);
  text("Cos wave", 200, 50);
}
