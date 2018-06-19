// A circular orbit, with a planet orbiting
class Orbit implements Drawable{
  float width, height; 
  
  color DEFAULT_COLOR = color(255, 0, 0);
  color oColor;
  
  // Orbital parameters 
  float bodySize = random(5,10);
  float rVel = random(5, 10), initPos = random(2); 
    
  public Orbit(float w, float h, color c) {
    this.width = w; 
    this.height = w; 
    oColor = c;
  }
  
  public Orbit(float w, float h) {
    this.width = w; 
    this.height = h; 
    oColor = DEFAULT_COLOR;
  }
  
  public void drawme(float t) {
    pushMatrix();
    
    float curX = cos(rVel * (t + initPos)) * (this.width / 2);
    float curY = sin(rVel * (t + initPos)) * (this.height / 2);
    translate(curX, curY);
    noStroke();
    fill(this.oColor);
    sphere(this.bodySize);
    translate(-curX, -curY);
    
    stroke(oColor); 
    noFill();
    ellipse(0, 0, this.width, this.height);
    
    popMatrix();
  }
}