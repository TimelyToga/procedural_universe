import java.util.ArrayList;

float x,y,z;

float pi, phi;

float t = 0; 

SolarSystem ss; 
Galaxy g;

color randColor() {
  float threshold = 300;
  float r = random(255);
  float g = random(255);
  float b = 0;
  if((r + g) < threshold) {
    b = random(threshold - (r + g), 255);
  } else {
    b = random(255);
  }
 
 return color(r, g, b);
}

void setup() {
  size(600, 480, P3D); 
  x = width/2;
  y = height/2;
  z = 0;
  rotateX(45);
  rotateY(45);
  rotateZ(45);
  lights();
  
  //ss = new SolarSystem(10);

  g = new Galaxy(20000);

  strokeWeight(2);
}

void draw() {
  translate(width/2, height/2, (sin(pi) * 400) - 100);
  rotateZ(pi);
  rotateY(pi);
  background(0);
  noFill();
  stroke(255, 255, 255);
  box(400, 400, 400); 
  ambientLight(102, 102, 102);
    
  //ss.drawme(t);
  g.drawme(t);
  
  pi += 0.003;
  t += 0.001;
}