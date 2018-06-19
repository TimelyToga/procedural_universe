class Star implements Drawable{
  float width, height; 
  
  color DEFAULT_COLOR = color(255, 255, 255);
  color oColor;
  
  // Orbital parameters 
  float bodySize = random(1);
  float rVel = random(5, 10), initPos = random(2); 
  float Z_RANGE = 8;
  float z; 
  float radius;
  
  private void create(float w, float h, color c) {
    this.width = w; 
    this.height = h; 
    this.oColor = c;
    
    this.z = randomGaussian() * Z_RANGE;
    this.radius = sqrt(pow(this.width, 2) + pow(this.height, 2));
  }
    
  public Star(float w, float h, color c) {
    create(w, h, c);
  }
  
  public Star(float w, float h) {
    create(w, h, DEFAULT_COLOR);
  }
  
  public void drawme(float t) {
    pushMatrix();
    
    //float curX = cos(rVel * (t + initPos)) * (this.width / 2);
    //float curY = sin(rVel * (t + initPos)) * (this.height / 2);
    //translate(curX, curY);
    //noStroke();
    //fill(this.oColor);
    stroke(255);
    point(width, height, z);
    //ellipse(curX, curY, bodySize, bodySize);
    //translate(-curX, -curY);
    
    //stroke(oColor); 
    //noFill();
    //ellipse(0, 0, this.width, this.height);
    
    popMatrix();
  }
}