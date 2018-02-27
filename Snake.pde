class Snake {
  float x;
  float xSpeed;
  float ySpeed;
  float y;
  float px;
  float py;
  
 public Snake(float xIn, float yIn) {
   x = xIn;
   y = yIn;
   xSpeed = 15;
 }
 
 void move() {
   if(keyCode == UP) {
     ySpeed = -15;
     xSpeed = 0;
   }
   else if(keyCode == DOWN) {
     ySpeed = 15;
     xSpeed = 0;
   }
   else if(keyCode ==LEFT) {
     xSpeed = -15;
     ySpeed = 0;
   }
   else if(keyCode == RIGHT) {
     xSpeed = 15;
     ySpeed = 0;
   }
 }
 
 void show() {
  px = x;
  py = y;
  x += xSpeed;
  y += ySpeed;
  fill(255);
  stroke(255,0,0);
  rect(x,y,15,15);
 }
}