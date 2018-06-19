class Galaxy implements Drawable  {
  
  ArrayList<Star> stars;
  
  int numStars;
  int maxX = 400, maxY = 400;
  int MIN_X = 30, MIN_Y = 30;
  
  float starSize;
  color cStar;
  
  private void generateDisk() {
    for(int a = 0; a < this.numStars; a++) {
      Star o = new Star(random(maxX), random(maxY), randColor());
      stars.add(o);
    }
  }
  
  private color spiralColor() {
     return color(random(214, 220), 242, 255); 
  }
    
  private void generateSpiral() {
    //float A = 0.5, B = 0.4, N = 8;
    float scale = 2;
    float upperBound = 6 *  PI;
    float spiralCompression = 0.25;
    float stepSize = (upperBound / this.numStars) * 2;
    
    for(float t = 0.0; t < upperBound; t += stepSize) {
      float x = scale * exp(spiralCompression*t) * cos(t);
      float y = scale * exp(spiralCompression*t) * sin(t);
      
      // Angle between this point and origin 
      float theta = atan2(y, x);
      
      // Fuzz distance from generate point 
      float fuzzFactor = min(0.2 * (exp(0.25 * t)) + 3, 30);
      float fuzz = randomGaussian() * fuzzFactor;
      
      // Generate offset from point
      float xOffset = fuzz * cos(theta);
      float yOffset = fuzz * sin(theta);
      
      // Final coordinates 
      float finalX = x + xOffset;
      float finalY = y + yOffset;
      
      
      // Create two mirrored stars
      stars.add(new Star(finalX, finalY, spiralColor()));
      stars.add(new Star(-finalX, -finalY, spiralColor()));
    }  
    
    // Create non-spiral disk stars
    int diskStars = 1000;
    float scatter = 65;
    color diskColor = color(255, 235, 63);
    
    for(int a = 0; a < diskStars; a++)  {
      float x = randomGaussian() * scatter;
      float y = randomGaussian() * scatter;
      stars.add(new Star(x, y, diskColor));
    }
  }
  
  public Galaxy(int nStars) {
    this.numStars = nStars;
    stars = new ArrayList();
    
    generateSpiral();
    
    starSize = random(5, 15);
    cStar = color(0, 0, 0);
  }
  
  public void drawme(float t) {
    // Draw star
    pointLight(255, 255, 255, 0, 0, 0);
    fill(cStar);
    sphere(starSize);
    
    // Render stars 
    for(Star s: stars) {
      s.drawme(t);
    }
  }
}