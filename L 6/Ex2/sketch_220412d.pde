float angPlanet1 = 0.0, angPlanet2 = PI/3.0, angPlanet3 = 2.0*PI/3.0, angMoon1 = 0.0, angMoon2 = PI;
void setup() {
  size(400, 400);
  stroke(255);
  frameRate(30);
}
void draw() {

  background(0);// Desenăm tot centrat la (0, 0) şi // rezolvăm poziţiile lor finale prin // transformări 2D. Steaua se află în // centrul universului nostru

  translate(width/2, height/2);// Specificăm culoarea în hexa
  noFill();
  ellipse(0, 0, 100, 100);
  ellipse(0, 0, 195, 195);
  ellipse(0, 0, 295, 295);
  fill(#F1FA03);
  ellipse(0, 0, 20, 20);
  pushMatrix();// Planeta 1
  rotate(angPlanet1 += 0.1);
  translate(width/2/4, 0);
  fill(#05FA03);
  ellipse(0, 0, 15, 15);// Planeta 2
  popMatrix();
  pushMatrix();
  rotate(angPlanet2 += 0.05);
  translate(width/2/4*2, 0);
  fill(#0BA00A);
  ellipse(0, 0, 15, 15);// Satelitul 1
  pushMatrix();
  rotate(angMoon1 += 0.1);
  translate(width/2/4/3, 0);
  fill(#08E4FF);
  ellipse(0, 0, 6, 6);// Satelitul 2
  popMatrix();
  rotate(angMoon2 += 0.05);
  translate(width/2/4/3*2, 0);
  fill(#118998);
  ellipse(0, 0, 6, 6);// Planeta 3
  popMatrix();
  rotate(angPlanet3 += 0.025);
  translate(width/2/4*3, 0);
  fill(#075806);
  ellipse(0, 0, 15, 15);
}
