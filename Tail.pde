class Tail {
  float x;
  float y;
  float px;
  float py;
  float r, g, b;
  
  public Tail(float xIn, float yIn) {
    x = xIn;
    y = yIn;
    //when constructed, pick a random color 
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  void show(float xIn, float yIn) {
   px = x;
   py = y;
   x = xIn;
   y = yIn;
   fill(r,g,b);
   stroke(255);
   rect(x, y, 15, 15);
  }
}