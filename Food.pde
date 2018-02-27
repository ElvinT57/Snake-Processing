class Food {
  PImage food;
 float x;
 float y;
 float r, g, b;
 public Food() {
   pickLoc();
   food = loadImage("apple.png");
   r = random(255);
   g = random(255);
   b = random(255);
 }
 
 void show() { 
   image(food, x, y, 20, 20);
 }
 
 void update(float xIn, float yIn) {
     if(xIn == x && yIn == y){
     x = random(width);
     y = random(height);
     float r = x%15.0;
     x = x-r;
     float ry = y%15.0;
     y = y-ry;
   }
 }
 
 void pickLoc() {
  x = random(width);
  y = random(height)-45;
  if(y < 15){
   y = 0; 
   float r = x%15.0;
  x = x-r;
  }
  else{
  float r = x%15.0;
  x = x-r;
  float ry = y%15.0;
  y = y-ry;
  }

}
}