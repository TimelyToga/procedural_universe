import java.util.ArrayList;

float pi = 0, t = 0;

SolarSystem starSystem; 
Galaxy galaxy;

color randColor() {
  // Generate a random, but bright color
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
  // Basic setup
  size(600, 480, P3D); 
  rotateX(45);
  rotateY(45);
  rotateZ(45);
  lights();
  
  //starSystem = new SolarSystem(10);
  
  // Initialize new Galaxy with 20k stars
  galaxy = new Galaxy(20000);

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
    
  //starSystem.drawme(t);
  galaxy.drawme(t);
  
  // Rotate world by a little bit
  pi += 0.003;
  
  // Increment timestep 
  t += 0.001;
}