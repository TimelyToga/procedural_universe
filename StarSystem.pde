class SolarSystem implements Drawable  {
  
  ArrayList<Orbit> orbits;
  
  int maxX = 100, maxY = 100;
  int MIN_X = 30, MIN_Y = 30;
  
  float starSize;
  color cStar;
  
  public SolarSystem(int nPlanets) {
    orbits = new ArrayList();
    
    float x = 0, y = 0; 
    for(int a = 0; a < nPlanets; a++) {
      if(x == 0) {
        x = random(maxX); 
      } else {
        x += random(20) + MIN_X; 
      }
      
      if(y == 0) {
        y = random(maxY);
      } else {
        y += random(20) + MIN_Y;
      }
      Orbit o = new Orbit(x, y, randColor());
      orbits.add(o);
    }
    
    starSize = random(5, 15);
    cStar = color(255, 0, random(255));
  }
  
  public void drawme(float t) {
    // Draw star
    pointLight(255, 255, 255, 0, 0, 0);
    fill(cStar);
    sphere(starSize);
    
    // Planets + orbital lines
    for(Orbit o: orbits) {
      o.drawme(t);
    }
  }
}